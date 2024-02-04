@kwdef struct create_params
IconUrl::Union{Nothing, String} = nothing
IsModerator::Union{Nothing, Bool} = nothing
CanEditMembersByModerator::Union{Nothing, Bool} = nothing
Name::Union{Nothing, String} = nothing
IsPublic::Union{Nothing, Bool} = nothing
Target::Union{Nothing, String} = nothing
Description::Union{Nothing, String} = nothing
AsBadge::Union{Nothing, Bool} = nothing
CondFormula::Union{Nothing, Dict} = nothing
IsAdministrator::Union{Nothing, Bool} = nothing
DisplayOrder::Union{Nothing, Number} = nothing
Policies::Union{Nothing, Dict} = nothing
IsExplorable::Union{Nothing, Bool} = false
Color::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *write:admin:roles*
=#
function create(params::create_params)
    if params.i == "" && true
        error("/admin/roles/create: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/admin/roles/create"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

