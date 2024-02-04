@kwdef struct pv_params
UserId::Union{Nothing, String} = nothing
Span::Union{Nothing, String} = nothing
Offset::Union{Nothing, Int64} = nothing
Limit::Union{Nothing, Int64} = 30

i::String = ""
end

#=                     
No description provided.

**Credential required**: *No*
=#
function pv(params::pv_params)
    if params.i == "" && false
        error("/charts/user/pv: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/charts/user/pv"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

