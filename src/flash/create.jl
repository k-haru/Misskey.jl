@kwdef struct create_params
Summary::Union{Nothing, String} = nothing
Visibility::Union{Nothing, String} = nothing
Script::Union{Nothing, String} = nothing
Title::Union{Nothing, String} = nothing
Permissions::Union{Nothing, Array} = nothing

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *write:flash*
=#
function create(params::create_params)
    if params.i == "" && true
        error("/flash/create: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/flash/create"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

