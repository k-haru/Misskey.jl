@kwdef struct get_table_stats_params
i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *read:admin:table-stats*
=#
function get_table_stats(params::get_table_stats_params)
    if params.i == "" && true
        error("/admin/get-table-stats: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/admin/get-table-stats"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

