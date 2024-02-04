@kwdef struct user_list_timeline_params
SinceId::Union{Nothing, String} = nothing
UntilId::Union{Nothing, String} = nothing
SinceDate::Union{Nothing, Int64} = nothing
WithFiles::Union{Nothing, Bool} = false
UntilDate::Union{Nothing, Int64} = nothing
WithRenotes::Union{Nothing, Bool} = true
IncludeRenotedMyNotes::Union{Nothing, Bool} = true
IncludeMyRenotes::Union{Nothing, Bool} = true
ListId::Union{Nothing, String} = nothing
AllowPartial::Union{Nothing, Bool} = false
IncludeLocalRenotes::Union{Nothing, Bool} = true
Limit::Union{Nothing, Int64} = 10

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *read:account*
=#
function user_list_timeline(params::user_list_timeline_params)
    if params.i == "" && true
        error("/notes/user-list-timeline: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/notes/user-list-timeline"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

