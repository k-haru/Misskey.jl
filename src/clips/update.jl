@kwdef struct update_params
Name::Union{Nothing, String} = nothing
IsPublic::Union{Nothing, Bool} = nothing
ClipId::Union{Nothing, String} = nothing
Description::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *write:account*
=#
function update(params::update_params)
    if params.i == "" && true
        error("/clips/update: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/clips/update"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

