@kwdef struct create_params
Name::Union{Nothing, String} = nothing
Secret::Union{Nothing, String} = ""
On::Union{Nothing, Array} = nothing
Url::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *write:account*
=#
function create(params::create_params)
    if params.i == "" && true
        error("/i/webhooks/create: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/i/webhooks/create"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

