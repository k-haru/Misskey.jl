@kwdef struct timeline_params
ChannelId::Union{Nothing, String} = nothing
UntilDate::Union{Nothing, Int64} = nothing
SinceId::Union{Nothing, String} = nothing
UntilId::Union{Nothing, String} = nothing
AllowPartial::Union{Nothing, Bool} = false
SinceDate::Union{Nothing, Int64} = nothing
Limit::Union{Nothing, Int64} = 10

i::String = ""
end

#=                     
No description provided.

**Credential required**: *No*
=#
function timeline(params::timeline_params)
    if params.i == "" && false
        error("/channels/timeline: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/channels/timeline"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

