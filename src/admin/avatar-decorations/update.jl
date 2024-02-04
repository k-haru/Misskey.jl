@kwdef struct update_params
Name::Union{Nothing, String} = nothing
Id::Union{Nothing, String} = nothing
Description::Union{Nothing, String} = nothing
Url::Union{Nothing, String} = nothing
RoleIdsThatCanBeUsedThisDecoration::Union{Nothing, Array} = nothing

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *write:admin:avatar-decorations*
=#
function update(params::update_params)
    if params.i == "" && true
        error("/admin/avatar-decorations/update: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/admin/avatar-decorations/update"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

