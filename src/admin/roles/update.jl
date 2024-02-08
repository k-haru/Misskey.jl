# THIS FILE IS GENERATED BY MACRO
@kwdef struct update_params
IconUrl::Union{Nothing, String} = nothing
RoleId::Union{Nothing, String} = nothing
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
IsExplorable::Union{Nothing, Bool} = nothing
Color::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *write:admin:roles*
=#
function update(server,params::update_params)
    if params.i == "" && true
        error("/admin/roles/update: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = string("https://",server,"/api","/admin/roles/update")
    params = Dict(lowercasefirst(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

