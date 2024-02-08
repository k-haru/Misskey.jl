# THIS FILE IS GENERATED BY MACRO
@kwdef struct update_params
Name::Union{Nothing, String} = nothing
IsPublic::Union{Nothing, Bool} = nothing
ListId::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
Update the properties of a list.

**Credential required**: *Yes* / **Permission**: *write:account*
=#
function update(server,params::update_params)
    if params.i == "" && true
        error("/users/lists/update: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = string("https://",server,"/api","/users/lists/update")
    params = Dict(lowercasefirst(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

