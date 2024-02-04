@kwdef struct relation_params
UserId::Any = nothing

i::String = ""
end

#=                     
Show the different kinds of relations between the authenticated user and the specified user(s).

**Credential required**: *Yes* / **Permission**: *read:account*
=#
function relation(params::relation_params)
    if params.i == "" && true
        error("/users/relation: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/users/relation"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

