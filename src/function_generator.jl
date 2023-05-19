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
    writeout_name = file |> x -> replace(x, ".json5" => "")
    writeout_path = joinpath(root, writeout_file * ".jl")
    endpoints = root |> x -> split(x, "\\endpoints")[2] |> x -> replace(x,"\\" => "/")


    expr = """
    function $(Symbol("writeout_name"))(str::String ;token::String = "")
        if json5_data["requireCredential"] == true && token == ""
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
        return "String"
    elseif type == "number"
        return "Number"
    elseif type == "boolean"
        return "Bool"
    elseif type == "any"
        return "Any"
    elseif type == "array"
        return "Array"
    elseif type == "object"
        return "Dict"
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
