@kwdef struct trend_params
i::String = ""
end

#=                     
No description provided.

**Credential required**: *No*
=#
function trend(params::trend_params)
    if params.i == "" && false
        error("/hashtags/trend: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/hashtags/trend"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

