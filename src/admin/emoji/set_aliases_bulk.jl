# THIS FILE IS GENERATED BY MACRO
@kwdef struct set_aliases_bulk_params
Aliases::Union{Nothing, Array} = nothing
Ids::Union{Nothing, Array} = nothing

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *write:admin:emoji*
=#
function set_aliases_bulk(server,params::set_aliases_bulk_params)
    if params.i == "" && true
        error("/admin/emoji/set-aliases-bulk: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = string("https://",server,"/api","/admin/emoji/set-aliases-bulk")
    params = Dict(lowercasefirst(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

