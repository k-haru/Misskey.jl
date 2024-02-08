# THIS FILE IS GENERATED BY MACRO
@kwdef struct followed_params
SinceId::Union{Nothing, String} = nothing
UntilId::Union{Nothing, String} = nothing
Limit::Union{Nothing, Int64} = 5

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *read:channels*
=#
function followed(server,params::followed_params)
    if params.i == "" && true
        error("/channels/followed: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = string("https://",server,"/api","/channels/followed")
    params = Dict(lowercasefirst(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

