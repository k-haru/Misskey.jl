@kwdef struct create_params
Name::Union{Nothing, String} = nothing
BannerId::Union{Nothing, String} = nothing
IsSensitive::Union{Nothing, Bool} = nothing
AllowRenoteToExternal::Union{Nothing, Bool} = nothing
Color::Union{Nothing, String} = nothing
Description::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *write:channels*
=#
function create(params::create_params)
    if params.i == "" && true
        error("/channels/create: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/channels/create"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

