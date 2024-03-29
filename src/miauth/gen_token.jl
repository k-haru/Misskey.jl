# THIS FILE IS GENERATED BY MACRO
@kwdef struct gen_token_params
Name::Union{Nothing, String} = nothing
IconUrl::Union{Nothing, String} = nothing
Permission::Union{Nothing, Array} = nothing
Description::Union{Nothing, String} = nothing
Session::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
No description provided.

**Internal Endpoint**: This endpoint is an API for the misskey mainframe and is not intended for use by third parties.
**Credential required**: *Yes*
=#
function gen_token(server,params::gen_token_params)
    if params.i == "" && true
        error("/miauth/gen-token: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = string("https://",server,"/api","/miauth/gen-token")
    params = Dict(lowercasefirst(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

