@kwdef struct emojis_params
i::String = ""
end

#=                     
No description provided.

**Credential required**: *No*
=#
function emojis(params::emojis_params)
    if params.i == "" && false
        error("/emojis: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/emojis"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

