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
    header = Dict("Content-Type" => "multipart/form-data")
    url = "https://misskey.io/api/drive/files/create"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

