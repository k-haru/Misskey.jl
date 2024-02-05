# THIS FILE IS GENERATED BY MACRO
@kwdef struct create_params
Name::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
Create a new list of users.

**Credential required**: *Yes* / **Permission**: *write:account*
=#
function create(params::create_params)
    if params.i == "" && true
        error("/users/lists/create: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/users/lists/create"
    params = Dict(lowercasefirst(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

