@kwdef struct key_done_params
Name::Union{Nothing, String} = nothing
Token::Union{Nothing, String} = nothing
Password::Union{Nothing, String} = nothing
Credential::Union{Nothing, Dict} = nothing

i::String = ""
end

#=                     
No description provided.

**Internal Endpoint**: This endpoint is an API for the misskey mainframe and is not intended for use by third parties.
**Credential required**: *Yes*
=#
function key_done(params::key_done_params)
    if params.i == "" && true
        error("/i/2fa/key-done: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/i/2fa/key-done"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

