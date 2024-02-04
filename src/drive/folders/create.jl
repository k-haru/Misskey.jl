@kwdef struct create_params
ParentId::Union{Nothing, String} = nothing
Name::Union{Nothing, String} = "Untitled"

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *write:drive*
=#
function create(params::create_params)
    if params.i == "" && true
        error("/drive/folders/create: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/drive/folders/create"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

