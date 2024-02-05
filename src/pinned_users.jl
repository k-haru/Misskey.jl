# THIS FILE IS GENERATED BY MACRO
@kwdef struct pinned_users_params
i::String = ""
end

#=                     
No description provided.

**Credential required**: *No*
=#
function pinned_users(params::pinned_users_params)
    if params.i == "" && false
        error("/pinned-users: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/pinned-users"
    params = Dict(lowercasefirst(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

