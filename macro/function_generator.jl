using json5peg, HTTP

this_dir = @__DIR__
src_dir = joinpath(this_dir, "..", "src")
api_dir = joinpath(this_dir, "..", "misskey-hub", "src", "docs", "api", "endpoints")
UN(T) = Union{Nothing,T}

function generate_function(root, file)
    json5_data = read(joinpath(root, file)) |> String |> json5_parse
    request = json5_data["req"]
    if isempty(request)
        names_types = ""
    else
        # handling request parameters
        properties = request["properties"]
        prop_keys = properties |> keys |> collect
        prop_values = properties |> values |> collect .|> x -> x["type"] |> type_to_julia
        prop_defaults = properties |> values |> collect .|> x -> try
            x["default"]
        catch
        end
        prop_initialize = prop_defaults .|> isnothing
        names_types =
            zip(prop_keys, prop_values, prop_initialize, prop_defaults) |>
            collect .|>
            x -> string(
                uppercasefirst(x[1]),
                "::",
                UN(x[2]),
                begin
                    x[3] ? " = nothing" :
                    " = $(typeof(x[4]) == String ? string("\"",x[4],"\"") : x[4])"
                end,
                "\n",
            )
    end
    name = file |> x -> replace(x, ".json5" => "") |> x -> replace(x, "-" => "_")

    endpoints = root |> x -> split(x, "\\endpoints")[2] |> x -> replace(x, "\\" => "/")
    writeout_path = string(src_dir, endpoints, "\\", name * ".jl")

    struct_expr = """
    @kwdef struct $(string(name, "_params"))
    $( names_types |> join)
    i::String = ""
    end""" |> Meta.parse

    function_expr =
        """
function $(Symbol(name))(server::String,params::$(string(name, "_params")))
if $(json5_data["requireCredential"]) && (params.i == "")
        error("This function require credential")
    end

    header = Dict("Content-Type" => "application/json")

    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post("https://\$(server)/api$(endpoints * "/" *name)", header, params)
    request.body |> String |> JSON.parse
end""" |> Meta.parse

    #write document
    open(writeout_path, "w") do io
        println(io, struct_expr)
        println(io, "\"$(json5_data["description"])\"") #write description for document

        println(io, function_expr)
    end
end

function type_to_julia(type)
    if type == "string"
        return String
    elseif type == "integer"
        return Int
    elseif type == "number"
        return Number
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


for (root, dirs, files) in walkdir(api_dir)
    files = files |> x -> filter(x -> endswith(x, ".json5"), x)

    root |> x -> split(x, "endpoints")[2] |> x -> src_dir * x |> mkpath

    for file in files
        try
            generate_function(root, file)
        catch
            println("error: $(root)$(file)")
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
