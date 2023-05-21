using json5peg, HTTP

this_dir = @__DIR__
src_dir = joinpath(this_dir, "..", "src")

function generate_module(root,dir)
    module_name = dir |> uppercasefirst |> x -> replace(x, "-" => "_")
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

end    end
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


#=endpoints_has_req = endpoints |> x -> filter(t -> haskey(t,"req"),x) 
endpoints_has_properties = endpoints_has_req |> x -> filter(t -> haskey(t["req"],"properties"),x) 
properties_list = endpoints_has_properties .|> x -> x["req"]["properties"] |> keys |> filter(!isempty)
properties = properties_list |> x -> foldl(union,x)
=#
# expr = "($(Symbol("asasdd")))(x) = x" |> Meta.parse
# expr |> Base.remove_linenums! |> string
#=     params = Dict("i" => token, "text" => str) |> JSON.json
    header = Dict("Content-Type" => "application/json")
    request = HTTP.post("https://misskey.io/api/notes/create", header, params)
    request.body |> String |> JSON.parse
    =#

# alljson_data = [read(joinpath(root,file)) |> String |> json5_parse for (root,dirs,files) in walkdir(".") for file in files |> x -> filter(x -> endswith(x, ".json5"), x)]
