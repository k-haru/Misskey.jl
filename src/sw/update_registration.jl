@kwdef struct update_registration_params
Endpoint::Union{Nothing, String} = nothing
SendReadMessage::Union{Nothing, Bool} = nothing

i::String = ""
end

#=                     
Update push notification registration.

**Internal Endpoint**: This endpoint is an API for the misskey mainframe and is not intended for use by third parties.
**Credential required**: *Yes*
=#
function update_registration(params::update_registration_params)
    if params.i == "" && true
        error("/sw/update-registration: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/sw/update-registration"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

