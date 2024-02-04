@kwdef struct notifications_params
IncludeTypes::Union{Nothing, Array} = nothing
SinceId::Union{Nothing, String} = nothing
UntilId::Union{Nothing, String} = nothing
MarkAsRead::Union{Nothing, Bool} = true
ExcludeTypes::Union{Nothing, Array} = nothing
Limit::Union{Nothing, Int64} = 10

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *read:notifications*
=#
function notifications(params::notifications_params)
    if params.i == "" && true
        error("/i/notifications: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/i/notifications"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

