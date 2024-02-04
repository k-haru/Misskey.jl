@kwdef struct assign_params
UserId::Union{Nothing, String} = nothing
RoleId::Union{Nothing, String} = nothing
ExpiresAt::Union{Nothing, Int64} = nothing

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *write:admin:roles*
=#
function assign(params::assign_params)
    if params.i == "" && true
        error("/admin/roles/assign: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/admin/roles/assign"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

