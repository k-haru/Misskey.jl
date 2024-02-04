@kwdef struct notes_params
Limit::Union{Nothing, Int64} = 10
UntilDate::Union{Nothing, Int64} = nothing
SinceId::Union{Nothing, String} = nothing
UntilId::Union{Nothing, String} = nothing
SinceDate::Union{Nothing, Int64} = nothing
AntennaId::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *read:account*
=#
function notes(params::notes_params)
    if params.i == "" && true
        error("/antennas/notes: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/antennas/notes"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

