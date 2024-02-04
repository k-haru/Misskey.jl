@kwdef struct match_params
UserId::Union{Nothing, String} = nothing
Multiple::Union{Nothing, Bool} = false
NoIrregularRules::Union{Nothing, Bool} = false

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *read:account*
=#
function match(params::match_params)
    if params.i == "" && true
        error("/reversi/match: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/reversi/match"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

