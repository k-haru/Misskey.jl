@kwdef struct get_memberships_params
SinceId::Union{Nothing, String} = nothing
UntilId::Union{Nothing, String} = nothing
ListId::Union{Nothing, String} = nothing
ForPublic::Union{Nothing, Bool} = false
Limit::Union{Nothing, Int64} = 30

i::String = ""
end

#=                     
No description provided.

**Credential required**: *No* / **Permission**: *read:account*
=#
function get_memberships(params::get_memberships_params)
    if params.i == "" && false
        error("/users/lists/get-memberships: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/users/lists/get-memberships"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

