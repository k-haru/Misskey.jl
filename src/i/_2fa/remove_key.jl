# THIS FILE IS GENERATED BY MACRO
@kwdef struct remove_key_params
CredentialId::Union{Nothing, String} = nothing
Token::Union{Nothing, String} = nothing
Password::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
No description provided.

**Internal Endpoint**: This endpoint is an API for the misskey mainframe and is not intended for use by third parties.
**Credential required**: *Yes*
=#
function remove_key(server,params::remove_key_params)
    if params.i == "" && true
        error("/i/2fa/remove-key: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = string("https://",server,"/api","/i/2fa/remove-key")
    params = Dict(lowercasefirst(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

