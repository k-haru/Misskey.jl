@kwdef struct upload_from_url_params
FolderId::Union{Nothing, String} = nothing
Marker::Union{Nothing, String} = nothing
IsSensitive::Union{Nothing, Bool} = false
Force::Union{Nothing, Bool} = false
Url::Union{Nothing, String} = nothing
Comment::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
Request the server to download a new drive file from the specified URL.

**Credential required**: *Yes* / **Permission**: *write:drive*
=#
function upload_from_url(params::upload_from_url_params)
    if params.i == "" && true
        error("/drive/files/upload-from-url: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/drive/files/upload-from-url"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

