@kwdef struct list_params
UserId::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
Show all lists that the authenticated user has created.

**Credential required**: *No* / **Permission**: *read:account*
=#
function list(params::list_params)
    if params.i == "" && false
        error("/users/lists/list: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/users/lists/list"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

