@kwdef struct register_params
Publickey::Union{Nothing, String} = nothing
Endpoint::Union{Nothing, String} = nothing
Auth::Union{Nothing, String} = nothing
SendReadMessage::Union{Nothing, Bool} = false

i::String = ""
end

#=                     
Register to receive push notifications.

**Internal Endpoint**: This endpoint is an API for the misskey mainframe and is not intended for use by third parties.
**Credential required**: *Yes*
=#
function register(params::register_params)
    if params.i == "" && true
        error("/sw/register: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/sw/register"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

