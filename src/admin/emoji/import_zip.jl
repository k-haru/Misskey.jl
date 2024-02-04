@kwdef struct import_zip_params
FileId::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
No description provided.

**Internal Endpoint**: This endpoint is an API for the misskey mainframe and is not intended for use by third parties.
**Credential required**: *Yes*
=#
function import_zip(params::import_zip_params)
    if params.i == "" && true
        error("/admin/emoji/import-zip: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/admin/emoji/import-zip"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

