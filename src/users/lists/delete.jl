@kwdef struct delete_params
ListId::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
Delete an existing list of users.

**Credential required**: *Yes* / **Permission**: *write:account*
=#
function delete(params::delete_params)
    if params.i == "" && true
        error("/users/lists/delete: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/users/lists/delete"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

