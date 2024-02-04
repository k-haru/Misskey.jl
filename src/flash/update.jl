@kwdef struct update_params
Summary::Union{Nothing, String} = nothing
Visibility::Union{Nothing, String} = nothing
Script::Union{Nothing, String} = nothing
Title::Union{Nothing, String} = nothing
Permissions::Union{Nothing, Array} = nothing
FlashId::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *write:flash*
=#
function update(params::update_params)
    if params.i == "" && true
        error("/flash/update: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/flash/update"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

