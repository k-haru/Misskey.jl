@kwdef struct create_params
Visibility::Union{Nothing, String} = "public"
ReplyId::Union{Nothing, String} = nothing
FileIds::Union{Nothing, Array} = nothing
NoExtractEmojis::Union{Nothing, Bool} = false
ChannelId::Union{Nothing, String} = nothing
LocalOnly::Union{Nothing, Bool} = false
ReactionAcceptance::Union{Nothing, String} = nothing
NoExtractHashtags::Union{Nothing, Bool} = false
RenoteId::Union{Nothing, String} = nothing
VisibleUserIds::Union{Nothing, Array} = nothing
Cw::Union{Nothing, String} = nothing
Poll::Union{Nothing, Dict} = nothing
NoExtractMentions::Union{Nothing, Bool} = false
Text::Union{Nothing, String} = nothing
MediaIds::Union{Nothing, Array} = nothing

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *write:notes*
=#
function create(params::create_params)
    if params.i == "" && true
        error("/notes/create: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/notes/create"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

