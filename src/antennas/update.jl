@kwdef struct update_params
WithFile::Union{Nothing, Bool} = nothing
UserListId::Union{Nothing, String} = nothing
Users::Union{Nothing, Array} = nothing
Keywords::Union{Nothing, Array} = nothing
WithReplies::Union{Nothing, Bool} = nothing
Name::Union{Nothing, String} = nothing
Src::Union{Nothing, String} = nothing
Notify::Union{Nothing, Bool} = nothing
LocalOnly::Union{Nothing, Bool} = nothing
AntennaId::Union{Nothing, String} = nothing
ExcludeKeywords::Union{Nothing, Array} = nothing
CaseSensitive::Union{Nothing, Bool} = nothing

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *write:account*
=#
function update(params::update_params)
    if params.i == "" && true
        error("/antennas/update: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/antennas/update"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

