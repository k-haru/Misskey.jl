@kwdef struct page_likes_params
SinceId::Union{Nothing, String} = nothing
UntilId::Union{Nothing, String} = nothing
Limit::Union{Nothing, Int64} = 10

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *read:page-likes*
=#
function page_likes(params::page_likes_params)
    if params.i == "" && true
        error("/i/page-likes: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/i/page-likes"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

