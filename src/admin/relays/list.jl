@kwdef struct list_params
i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *read:admin:relays*
=#
function list(params::list_params)
    if params.i == "" && true
        error("/admin/relays/list: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/admin/relays/list"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

