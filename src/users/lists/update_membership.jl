@kwdef struct update_membership_params
UserId::Union{Nothing, String} = nothing
WithReplies::Union{Nothing, Bool} = nothing
ListId::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *write:account*
=#
function update_membership(params::update_membership_params)
    if params.i == "" && true
        error("/users/lists/update-membership: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/users/lists/update-membership"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end
