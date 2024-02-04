@kwdef struct get_online_users_count_params
i::String = ""
end

#=                     
No description provided.

**Credential required**: *No*
=#
function get_online_users_count(params::get_online_users_count_params)
    if params.i == "" && false
        error("/get-online-users-count: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/get-online-users-count"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

