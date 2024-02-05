using JSON, Downloads

include("generate_endpoint.jl")

# Initialize the directory and the file
this_dir = @__DIR__
src_dir = joinpath(this_dir, "..", "src")

default_server = "misskey.io" ## Change this to your server
api_file = joinpath(this_dir, "openapi", "api.json")
Downloads.download("https://misskey.io/api.json", api_file)
api = read(api_file, String) |> JSON.parse

# Preprocess the openapi file
api_keys = keys(api) |> collect
for key in api_keys
    eval_string = " $(key) = get(api, \"$(key)\", nothing)"
    include_string(Main, eval_string)
end

endpoints = keys(api["paths"]) |> collect |> sort |> eps -> sort(eps, by=ep -> count("/", ep))


for endpoint in endpoints
    # make path
    endpoint_dir = endpoint |> st -> split(st, "/")[1:end-1] |> st -> joinpath(src_dir, st...)
    endpoint_dir |> mkpath
    # make file
    post_data = paths[endpoint]["post"]

    try
        generate_endpoint(endpoint, post_data, default_server)
    catch e
        println("error: $(endpoint)")
        println(e)
    end
end

function generate_module(root,dir)
    module_name = dir |> uppercasefirst |> x -> replace(x, "-" => "_")
    # if module_name include number, add underscore
    if occursin(r"\d", module_name)
        module_name = replace(module_name, r"(\d)" => s"_\1")
    end
    module_path = joinpath(root, dir, module_name*".jl")
    module_expr = """
    module $(module_name)
    using JSON, HTTP
    # include child functions in this directory
    let
    src_dir = @__DIR__
    functions =
        readdir(src_dir) |>
        filter(x -> endswith(x, ".jl")) |>
        filter(x -> islowercase(x[1]))
    functions .|> include

    # include child modules in child directories

    modules =
    readdir(src_dir) |> filter(x -> isdir(joinpath(src_dir, x))) .|> uppercasefirst
    modules .|> x -> include(joinpath(src_dir, lowercase(x), replace(x,"-" => "_") * ".jl"))

    end    
    end
    """

    open(module_path, "w") do f
        write(f, module_expr)
    end

end

for (root, dirs, files) in walkdir(src_dir)
    for dir in dirs
        try
            generate_module(root, dir)
        catch
            println("error: $(root)$(dir)")
        end
    end
end