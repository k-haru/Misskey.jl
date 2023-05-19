using json5peg, HTTP

this_dir = @__DIR__
api_dir = joinpath(this_dir, "..", "misskey-hub", "src", "docs", "api","endpoints")

for (root, dirs, files) in walkdir(api_dir)
    files = files |> x -> filter(x -> endswith(x, ".json5"), x)

    root |> x -> split(x, "endpoints")[2] |> x -> this_dir * x |> mkpath

    for file in files
        #generate_function(root,file)
    end
end

function generate_function(root, file)
    json5_data = read(joinpath(root, file)) |> String |> json5_parse
    properties = json5_data["req"]["properties"]
    prop_keys = properties |> keys
    prop_values = properties |> values |> collect .|> x -> x["type"] |> type_to_julia
    prop_defaults = properties |> values |> collect .|> x -> try x["default"] catch end
    prop_null = properties |> values |> collect .|> x -> try x["nullable"] catch end

    names_types = zip(prop_keys, prop_values,prop_defaults) |> collect .|> x -> x[1] * "::" * x[2] * (x[3] == nothing ? "" : " = " * "$(x[3])") * "\n"

    name = file |> x -> replace(x, ".json5" => "")
    writeout_path = joinpath(root, name * ".jl")
    endpoints = root |> x -> split(x, "\\endpoints")[2] |> x -> replace(x,"\\" => "/")

    struct_expr = """
    @kwdef struct Params
    $( names_types |> join)
    token::String = ""
    end""" |> Meta.parse

    function_expr = """
    function $(Symbol("writeout_name"))(params::Params)
    if json5_data["requireCredential"] && (Params.token == "")
            error("This function require credential")
        end

        header = Dict("Content-Type" => "application/json")

        params = Dict("i" => token, "text" => str) |> JSON.json
        request = HTTP.post("https://misskey.io/api$(endpoints)", header, params)
        request.body |> String |> JSON.parse
    end
    """ |> Meta.parse

    #write document
    open(writeout_path, "w") do io
        println(io, "\"$(json5_data["description"])\"") #write description for document
        
    end
    write(writeout_path, expr |> Base.remove_linenums! |> string)
end

function type_to_julia(type)
    if type == "string"
        return String
    elseif type == "integer"
        return Int
    elseif type == "boolean"
        return Bool
    elseif type == "any"
        return Any
    elseif type == "array"
        return Array
    elseif type == "object"
        return Dict
    end
end

endpoints_has_req = endpoints |> x -> filter(t -> haskey(t,"req"),x) 
endpoints_has_properties = endpoints_has_req |> x -> filter(t -> haskey(t["req"],"properties"),x) 
properties_list = endpoints_has_properties .|> x -> x["req"]["properties"] |> keys |> filter(!isempty)
properties = properties_list |> x -> foldl(union,x)

# expr = "($(Symbol("asasdd")))(x) = x" |> Meta.parse
# expr |> Base.remove_linenums! |> string
#=     params = Dict("i" => token, "text" => str) |> JSON.json
    header = Dict("Content-Type" => "application/json")
    request = HTTP.post("https://misskey.io/api/notes/create", header, params)
    request.body |> String |> JSON.parse
    =#

# alljson_data = [read(joinpath(root,file)) |> String |> json5_parse for (root,dirs,files) in walkdir(".") for file in files |> x -> filter(x -> endswith(x, ".json5"), x)]
