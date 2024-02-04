@kwdef struct list_params
Offset::Union{Nothing, Int64} = 0
Sort::Union{Nothing, String} = nothing
Type::Union{Nothing, String} = "all"
Limit::Union{Nothing, Int64} = 30

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *read:admin:invite-codes*
=#
function list(params::list_params)
    if params.i == "" && true
        error("/admin/invite/list: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/admin/invite/list"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

