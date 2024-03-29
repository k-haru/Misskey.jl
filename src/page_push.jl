# THIS FILE IS GENERATED BY MACRO
@kwdef struct page_push_params
Event::Union{Nothing, String} = nothing
PageId::Union{Nothing, String} = nothing
Var::Any = nothing

i::String = ""
end

#=                     
No description provided.

**Internal Endpoint**: This endpoint is an API for the misskey mainframe and is not intended for use by third parties.
**Credential required**: *Yes*
=#
function page_push(server,params::page_push_params)
    if params.i == "" && true
        error("/page-push: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = string("https://",server,"/api","/page-push")
    params = Dict(lowercasefirst(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

