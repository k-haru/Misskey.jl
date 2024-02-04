@kwdef struct server_info_params
i::String = ""
end

#=                     
No description provided.

**Credential required**: *No*
=#
function server_info(params::server_info_params)
    if params.i == "" && false
        error("/server-info: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/server-info"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

