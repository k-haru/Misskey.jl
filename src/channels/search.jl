@kwdef struct search_params
SinceId::Union{Nothing, String} = nothing
UntilId::Union{Nothing, String} = nothing
Query::Union{Nothing, String} = nothing
Type::Union{Nothing, String} = "nameAndDescription"
Limit::Union{Nothing, Int64} = 5

i::String = ""
end

#=                     
No description provided.

**Credential required**: *No*
=#
function search(params::search_params)
    if params.i == "" && false
        error("/channels/search: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/channels/search"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

