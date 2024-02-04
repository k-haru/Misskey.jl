@kwdef struct export_following_params
ExcludeMuting::Union{Nothing, Bool} = false
ExcludeInactive::Union{Nothing, Bool} = false

i::String = ""
end

#=                     
No description provided.

**Internal Endpoint**: This endpoint is an API for the misskey mainframe and is not intended for use by third parties.
**Credential required**: *Yes*
=#
function export_following(params::export_following_params)
    if params.i == "" && true
        error("/i/export-following: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/i/export-following"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

