# THIS FILE IS GENERATED BY MACRO
@kwdef struct featured_params
i::String = ""
end

#=                     
No description provided.

**Credential required**: *No*
=#
function featured(params::featured_params)
    if params.i == "" && false
        error("/pages/featured: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/pages/featured"
    params = Dict(lowercasefirst(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

