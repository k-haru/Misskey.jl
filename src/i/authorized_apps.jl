@kwdef struct authorized_apps_params
Offset::Union{Nothing, Int64} = 0
Sort::Union{Nothing, String} = "desc"
Limit::Union{Nothing, Int64} = 10

i::String = ""
end

#=                     
No description provided.

**Internal Endpoint**: This endpoint is an API for the misskey mainframe and is not intended for use by third parties.
**Credential required**: *Yes*
=#
function authorized_apps(params::authorized_apps_params)
    if params.i == "" && true
        error("/i/authorized-apps: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/i/authorized-apps"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end
