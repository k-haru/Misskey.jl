@kwdef struct reset_db_params
i::String = ""
end

#=                     
Only available when running with <code>NODE_ENV=testing</code>. Reset the database and flush Redis.

**Credential required**: *No*
=#
function reset_db(params::reset_db_params)
    if params.i == "" && false
        error("/reset-db: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/reset-db"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

