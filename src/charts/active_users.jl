# THIS FILE IS GENERATED BY MACRO
@kwdef struct active_users_params
Span::Union{Nothing, String} = nothing
Offset::Union{Nothing, Int64} = nothing
Limit::Union{Nothing, Int64} = 30

i::String = ""
end

#=                     
No description provided.

**Credential required**: *No*
=#
function active_users(params::active_users_params)
    if params.i == "" && false
        error("/charts/active-users: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/charts/active-users"
    params = Dict(lowercasefirst(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

