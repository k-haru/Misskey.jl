@kwdef struct set_category_bulk_params
Ids::Union{Nothing, Array} = nothing
Category::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *write:admin:emoji*
=#
function set_category_bulk(params::set_category_bulk_params)
    if params.i == "" && true
        error("/admin/emoji/set-category-bulk: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/admin/emoji/set-category-bulk"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

