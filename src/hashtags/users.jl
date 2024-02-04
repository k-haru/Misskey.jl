@kwdef struct users_params
State::Union{Nothing, String} = "all"
Origin::Union{Nothing, String} = "local"
Tag::Union{Nothing, String} = nothing
Sort::Union{Nothing, String} = nothing
Limit::Union{Nothing, Int64} = 10

i::String = ""
end

#=                     
No description provided.

**Credential required**: *No*
=#
function users(params::users_params)
    if params.i == "" && false
        error("/hashtags/users: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/hashtags/users"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

