@kwdef struct delete_params
PageId::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *write:pages*
=#
function delete(params::delete_params)
    if params.i == "" && true
        error("/pages/delete: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/pages/delete"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

