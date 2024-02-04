@kwdef struct push_params
UserId::Union{Nothing, String} = nothing
ListId::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
Add a user to an existing list.

**Credential required**: *Yes* / **Permission**: *write:account*
=#
function push(params::push_params)
    if params.i == "" && true
        error("/users/lists/push: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/users/lists/push"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

