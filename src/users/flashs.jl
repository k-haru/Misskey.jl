@kwdef struct flashs_params
UserId::Union{Nothing, String} = nothing
SinceId::Union{Nothing, String} = nothing
UntilId::Union{Nothing, String} = nothing
Limit::Union{Nothing, Int64} = 10

i::String = ""
end

#=                     
Show all flashs this user created.

**Credential required**: *No*
=#
function flashs(params::flashs_params)
    if params.i == "" && false
        error("/users/flashs: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/users/flashs"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

