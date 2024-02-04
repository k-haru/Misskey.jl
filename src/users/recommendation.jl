@kwdef struct recommendation_params
Offset::Union{Nothing, Int64} = 0
Limit::Union{Nothing, Int64} = 10

i::String = ""
end

#=                     
Show users that the authenticated user might be interested to follow.

**Credential required**: *Yes* / **Permission**: *read:account*
=#
function recommendation(params::recommendation_params)
    if params.i == "" && true
        error("/users/recommendation: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/users/recommendation"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

