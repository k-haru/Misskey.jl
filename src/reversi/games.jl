@kwdef struct games_params
SinceId::Union{Nothing, String} = nothing
UntilId::Union{Nothing, String} = nothing
My::Union{Nothing, Bool} = false
Limit::Union{Nothing, Int64} = 10

i::String = ""
end

#=                     
No description provided.

**Credential required**: *No*
=#
function games(params::games_params)
    if params.i == "" && false
        error("/reversi/games: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/reversi/games"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end
