@kwdef struct get_all_params
Scope::Union{Nothing, Array} = Any[]
Domain::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *read:account*
=#
function get_all(params::get_all_params)
    if params.i == "" && true
        error("/i/registry/get-all: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/i/registry/get-all"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

