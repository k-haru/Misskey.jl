@kwdef struct search_by_tag_params
Tag::Union{Nothing, String} = nothing
WithFiles::Union{Nothing, Bool} = false
Reply::Union{Nothing, Bool} = nothing
SinceId::Union{Nothing, String} = nothing
UntilId::Union{Nothing, String} = nothing
Poll::Union{Nothing, Bool} = nothing
Query::Union{Nothing, Array} = nothing
Renote::Union{Nothing, Bool} = nothing
Limit::Union{Nothing, Int64} = 10

i::String = ""
end

#=                     
No description provided.

**Credential required**: *No*
=#
function search_by_tag(params::search_by_tag_params)
    if params.i == "" && false
        error("/notes/search-by-tag: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/notes/search-by-tag"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

