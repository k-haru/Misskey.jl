@kwdef struct available_params
Username::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
No description provided.

**Credential required**: *No*
=#
function available(params::available_params)
    if params.i == "" && false
        error("/username/available: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/username/available"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

