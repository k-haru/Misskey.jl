@kwdef struct search_params
Origin::Union{Nothing, String} = "combined"
Detail::Union{Nothing, Bool} = true
Offset::Union{Nothing, Int64} = 0
Query::Union{Nothing, String} = nothing
Limit::Union{Nothing, Int64} = 10

i::String = ""
end

#=                     
Search for users.

**Credential required**: *No*
=#
function search(params::search_params)
    if params.i == "" && false
        error("/users/search: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/users/search"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

