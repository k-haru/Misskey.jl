@kwdef struct create_params
Name::Union{Nothing, String} = nothing
Permission::Union{Nothing, Array} = nothing
CallbackUrl::Union{Nothing, String} = nothing
Description::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
No description provided.

**Credential required**: *No*
=#
function create(params::create_params)
    if params.i == "" && false
        error("/app/create: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/app/create"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

