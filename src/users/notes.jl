# THIS FILE IS GENERATED BY MACRO
@kwdef struct notes_params
SinceId::Union{Nothing, String} = nothing
UntilId::Union{Nothing, String} = nothing
WithReplies::Union{Nothing, Bool} = false
SinceDate::Union{Nothing, Int64} = nothing
WithFiles::Union{Nothing, Bool} = false
UntilDate::Union{Nothing, Int64} = nothing
WithRenotes::Union{Nothing, Bool} = true
WithChannelNotes::Union{Nothing, Bool} = false
UserId::Union{Nothing, String} = nothing
AllowPartial::Union{Nothing, Bool} = false
Limit::Union{Nothing, Int64} = 10

i::String = ""
end

#=                     
No description provided.

**Credential required**: *No*
=#
function notes(server,params::notes_params)
    if params.i == "" && false
        error("/users/notes: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = string("https://",server,"/api","/users/notes")
    params = Dict(lowercasefirst(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

