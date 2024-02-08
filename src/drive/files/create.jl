# THIS FILE IS GENERATED BY MACRO
@kwdef struct create_params
Name::Union{Nothing, String} = nothing
FolderId::Union{Nothing, String} = nothing
IsSensitive::Union{Nothing, Bool} = false
File::Union{Nothing, String} = nothing
Force::Union{Nothing, Bool} = false
Comment::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
Upload a new drive file.

**Credential required**: *Yes* / **Permission**: *write:drive*
=#
function create(params::create_params)
    if params.i == "" && true
        error("/drive/files/create: This function require credential")
    end

    
    url = "https://misskey.io/api/drive/files/create"
    params = Dict(lowercasefirst(string(key)) => getfield(params, key) for key in propertynames(params)) |> 
    x -> filter(t -> t.second != nothing,x) 

    for (key, value) in params
        if typeof(value) == Bool
            params[key] = string(value)
        end
        if key == "file" 
            if isfile(value)
                params[key] = HTTP.Multipart(value,open(value))
            else
                error(value," is not a file")
            end
        end
    end

    body = HTTP.Form(params)

    request = HTTP.post(url, [], body)
    request.body |> String |> JSON.parse
end

