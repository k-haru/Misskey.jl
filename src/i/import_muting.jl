@kwdef struct import_muting_params
FileId::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
No description provided.

**Internal Endpoint**: This endpoint is an API for the misskey mainframe and is not intended for use by third parties.
**Credential required**: *Yes*
=#
function import_muting(params::import_muting_params)
    if params.i == "" && true
        error("/i/import-muting: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/i/import-muting"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

