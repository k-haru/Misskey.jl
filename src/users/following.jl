@kwdef struct following_params
UserId::Union{Nothing, String} = nothing
Host::Union{Nothing, String} = nothing
SinceId::Union{Nothing, String} = nothing
UntilId::Union{Nothing, String} = nothing
Username::Union{Nothing, String} = nothing
Birthday::Union{Nothing, String} = nothing
Limit::Union{Nothing, Int64} = 10

i::String = ""
end

#=                     
Show everyone that this user is following.

**Credential required**: *No*
=#
function following(params::following_params)
    if params.i == "" && false
        error("/users/following: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/users/following"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

