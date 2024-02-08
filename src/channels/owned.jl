# THIS FILE IS GENERATED BY MACRO
@kwdef struct owned_params
SinceId::Union{Nothing, String} = nothing
UntilId::Union{Nothing, String} = nothing
Limit::Union{Nothing, Int64} = 5

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *read:channels*
=#
function owned(server,params::owned_params)
    if params.i == "" && true
        error("/channels/owned: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = string("https://",server,"/api","/channels/owned")
    params = Dict(lowercasefirst(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

