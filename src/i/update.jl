@kwdef struct update_params
NotificationRecieveConfig::Union{Nothing, Dict} = nothing
Fields::Union{Nothing, Array} = nothing
IsBot::Union{Nothing, Bool} = nothing
IsLocked::Union{Nothing, Bool} = nothing
FollowingVisibility::Union{Nothing, String} = nothing
AvatarDecorations::Union{Nothing, Array} = nothing
FollowersVisibility::Union{Nothing, String} = nothing
PinnedPageId::Union{Nothing, String} = nothing
InjectFeaturedNote::Union{Nothing, Bool} = nothing
Name::Union{Nothing, String} = nothing
Location::Union{Nothing, String} = nothing
HideOnlineStatus::Union{Nothing, Bool} = nothing
BannerId::Union{Nothing, String} = nothing
AvatarId::Union{Nothing, String} = nothing
CarefulBot::Union{Nothing, Bool} = nothing
IsCat::Union{Nothing, Bool} = nothing
Description::Union{Nothing, String} = nothing
ReceiveAnnouncementEmail::Union{Nothing, Bool} = nothing
NoCrawle::Union{Nothing, Bool} = nothing
MutedWords::Union{Nothing, Array} = nothing
PublicReactions::Union{Nothing, Bool} = nothing
AutoAcceptFollowed::Union{Nothing, Bool} = nothing
AlsoKnownAs::Union{Nothing, Array} = nothing
IsExplorable::Union{Nothing, Bool} = nothing
AlwaysMarkNsfw::Union{Nothing, Bool} = nothing
AutoSensitive::Union{Nothing, Bool} = nothing
MutedInstances::Union{Nothing, Array} = nothing
PreventAiLearning::Union{Nothing, Bool} = nothing
Birthday::Union{Nothing, String} = nothing
Lang::Union{Nothing, String} = nothing
EmailNotificationTypes::Union{Nothing, Array} = nothing

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *write:account*
=#
function update(params::update_params)
    if params.i == "" && true
        error("/i/update: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/i/update"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

