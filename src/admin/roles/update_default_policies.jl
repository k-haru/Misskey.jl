@kwdef struct update_default_policies_params
Policies::Union{Nothing, Dict} = nothing

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *write:admin:roles*
=#
function update_default_policies(params::update_default_policies_params)
    if params.i == "" && true
        error("/admin/roles/update-default-policies: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/admin/roles/update-default-policies"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

