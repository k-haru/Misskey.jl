@kwdef struct userkey_params
AppSecret::Union{Nothing, String} = nothing
Token::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
No description provided.

**Credential required**: *No*
=#
function userkey(params::userkey_params)
    if params.i == "" && false
        error("/auth/session/userkey: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/auth/session/userkey"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

