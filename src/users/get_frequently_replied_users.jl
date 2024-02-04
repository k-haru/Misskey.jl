@kwdef struct get_frequently_replied_users_params
UserId::Union{Nothing, String} = nothing
Limit::Union{Nothing, Int64} = 10

i::String = ""
end

#=                     
Get a list of other users that the specified user frequently replies to.

**Credential required**: *No*
=#
function get_frequently_replied_users(params::get_frequently_replied_users_params)
    if params.i == "" && false
        error("/users/get-frequently-replied-users: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/users/get-frequently-replied-users"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

