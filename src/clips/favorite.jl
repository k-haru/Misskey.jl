# THIS FILE IS GENERATED BY MACRO
@kwdef struct favorite_params
ClipId::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *write:clip-favorite*
=#
function favorite(server,params::favorite_params)
    if params.i == "" && true
        error("/clips/favorite: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = string("https://",server,"/api","/clips/favorite")
    params = Dict(lowercasefirst(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

