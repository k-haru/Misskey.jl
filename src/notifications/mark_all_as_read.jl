@kwdef struct mark_all_as_read_params
i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *write:notifications*
=#
function mark_all_as_read(params::mark_all_as_read_params)
    if params.i == "" && true
        error("/notifications/mark-all-as-read: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/notifications/mark-all-as-read"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

