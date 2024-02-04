@kwdef struct get_avatar_decorations_params
i::String = ""
end

#=                     
No description provided.

**Credential required**: *No*
=#
function get_avatar_decorations(params::get_avatar_decorations_params)
    if params.i == "" && false
        error("/get-avatar-decorations: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/get-avatar-decorations"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end
