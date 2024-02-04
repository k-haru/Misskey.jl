@kwdef struct create_params
Body::Union{Nothing, String} = nothing
Header::Union{Nothing, String} = nothing
Icon::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *write:notifications*
=#
function create(params::create_params)
    if params.i == "" && true
        error("/notifications/create: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/notifications/create"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

