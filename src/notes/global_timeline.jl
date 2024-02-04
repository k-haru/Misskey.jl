@kwdef struct global_timeline_params
WithFiles::Union{Nothing, Bool} = false
UntilDate::Union{Nothing, Int64} = nothing
SinceId::Union{Nothing, String} = nothing
UntilId::Union{Nothing, String} = nothing
WithRenotes::Union{Nothing, Bool} = true
SinceDate::Union{Nothing, Int64} = nothing
Limit::Union{Nothing, Int64} = 10

i::String = ""
end

#=                     
No description provided.

**Credential required**: *No*
=#
function global_timeline(params::global_timeline_params)
    if params.i == "" && false
        error("/notes/global-timeline: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/notes/global-timeline"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

