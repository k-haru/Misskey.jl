@kwdef struct signin_history_params
SinceId::Union{Nothing, String} = nothing
UntilId::Union{Nothing, String} = nothing
Limit::Union{Nothing, Int64} = 10

i::String = ""
end

#=                     
No description provided.

**Internal Endpoint**: This endpoint is an API for the misskey mainframe and is not intended for use by third parties.
**Credential required**: *Yes*
=#
function signin_history(params::signin_history_params)
    if params.i == "" && true
        error("/i/signin-history: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/i/signin-history"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

