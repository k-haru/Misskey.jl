# THIS FILE IS GENERATED BY MACRO
@kwdef struct local_timeline_params
WithFiles::Union{Nothing, Bool} = false
UntilDate::Union{Nothing, Int64} = nothing
SinceId::Union{Nothing, String} = nothing
UntilId::Union{Nothing, String} = nothing
WithRenotes::Union{Nothing, Bool} = true
WithReplies::Union{Nothing, Bool} = false
AllowPartial::Union{Nothing, Bool} = false
SinceDate::Union{Nothing, Int64} = nothing
Limit::Union{Nothing, Int64} = 10

i::String = ""
end

#=                     
No description provided.

**Credential required**: *No*
=#
function local_timeline(server,params::local_timeline_params)
    if params.i == "" && false
        error("/notes/local-timeline: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = string("https://",server,"/api","/notes/local-timeline")
    params = Dict(lowercasefirst(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

