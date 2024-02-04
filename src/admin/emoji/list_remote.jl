@kwdef struct list_remote_params
Host::Union{Nothing, String} = nothing
SinceId::Union{Nothing, String} = nothing
UntilId::Union{Nothing, String} = nothing
Query::Union{Nothing, String} = nothing
Limit::Union{Nothing, Int64} = 10

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *read:admin:emoji*
=#
function list_remote(params::list_remote_params)
    if params.i == "" && true
        error("/admin/emoji/list-remote: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/admin/emoji/list-remote"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

