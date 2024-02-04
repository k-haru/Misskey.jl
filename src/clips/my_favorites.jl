@kwdef struct my_favorites_params
i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *read:clip-favorite*
=#
function my_favorites(params::my_favorites_params)
    if params.i == "" && true
        error("/clips/my-favorites: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/clips/my-favorites"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

