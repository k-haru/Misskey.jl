@kwdef struct create_params
i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *write:invite-codes*
=#
function create(params::create_params)
    if params.i == "" && true
        error("/invite/create: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/invite/create"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

