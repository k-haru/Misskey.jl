@kwdef struct register_params
Score::Union{Nothing, Int64} = nothing
Logs::Union{Nothing, Array} = nothing
GameMode::Union{Nothing, String} = nothing
GameVersion::Union{Nothing, Int64} = nothing
Seed::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *write:account*
=#
function register(params::register_params)
    if params.i == "" && true
        error("/bubble-game/register: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/bubble-game/register"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

