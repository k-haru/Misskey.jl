@kwdef struct create_params
UserId::Union{Nothing, String} = nothing
ExpiresAt::Union{Nothing, Int64} = nothing

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *write:mutes*
=#
function create(params::create_params)
    if params.i == "" && true
        error("/mute/create: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/mute/create"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

