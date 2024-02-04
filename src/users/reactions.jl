@kwdef struct reactions_params
UserId::Union{Nothing, String} = nothing
UntilDate::Union{Nothing, Int64} = nothing
SinceId::Union{Nothing, String} = nothing
UntilId::Union{Nothing, String} = nothing
SinceDate::Union{Nothing, Int64} = nothing
Limit::Union{Nothing, Int64} = 10

i::String = ""
end

#=                     
Show all reactions this user made.

**Credential required**: *No*
=#
function reactions(params::reactions_params)
    if params.i == "" && false
        error("/users/reactions: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/users/reactions"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

