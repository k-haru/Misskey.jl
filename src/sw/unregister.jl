@kwdef struct unregister_params
Endpoint::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
Unregister from receiving push notifications.

**Credential required**: *No*
=#
function unregister(params::unregister_params)
    if params.i == "" && false
        error("/sw/unregister: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/sw/unregister"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

