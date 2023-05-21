#= none:1 =# @kwdef struct update_params
        #= none:2 =#
        ShowTimelineReplies::Union{Nothing, Bool} = nothing
        #= none:3 =#
        Fields::Union{Nothing, Array} = nothing
        #= none:4 =#
        IsBot::Union{Nothing, Bool} = nothing
        #= none:5 =#
        IsLocked::Union{Nothing, Bool} = nothing
        #= none:6 =#
        PinnedPageId::Union{Nothing, Array} = nothing
        #= none:7 =#
        InjectFeaturedNote::Union{Nothing, Bool} = nothing
        #= none:8 =#
        Name::Union{Nothing, String} = nothing
        #= none:9 =#
        Location::Union{Nothing, String} = nothing
        #= none:10 =#
        HideOnlineStatus::Union{Nothing, Bool} = nothing
        #= none:11 =#
        BannerId::Union{Nothing, String} = nothing
        #= none:12 =#
        AvatarId::Union{Nothing, String} = nothing
        #= none:13 =#
        CarefulBot::Union{Nothing, Bool} = nothing
        #= none:14 =#
        IsCat::Union{Nothing, Bool} = nothing
        #= none:15 =#
        FfVisibility::Union{Nothing, String} = nothing
        #= none:16 =#
        Description::Union{Nothing, String} = nothing
        #= none:17 =#
        ReceiveAnnouncementEmail::Union{Nothing, Bool} = nothing
        #= none:18 =#
        NoCrawle::Union{Nothing, Bool} = nothing
        #= none:19 =#
        MutedWords::Union{Nothing, Array} = nothing
        #= none:20 =#
        PublicReactions::Union{Nothing, Bool} = nothing
        #= none:21 =#
        MutingNotificationTypes::Union{Nothing, Array} = nothing
        #= none:22 =#
        AutoAcceptFollowed::Union{Nothing, Bool} = nothing
        #= none:23 =#
        IsExplorable::Union{Nothing, Bool} = nothing
        #= none:24 =#
        AlwaysMarkNsfw::Union{Nothing, Bool} = nothing
        #= none:25 =#
        AutoSensitive::Union{Nothing, Bool} = nothing
        #= none:26 =#
        MutedInstances::Union{Nothing, Array} = nothing
        #= none:27 =#
        Birthday::Union{Nothing, String} = nothing
        #= none:28 =#
        Lang::Union{Nothing, String} = nothing
        #= none:29 =#
        EmailNotificationTypes::Union{Nothing, Array} = nothing
        #= none:31 =#
        i::String = ""
    end
"ログイン中のユーザーのプロフィール・設定を更新します。パラメータの値を設定しなければ、その項目は変更されません。"
function update(server::String, params::update_params)
    #= none:1 =#
    #= none:2 =#
    if true && params.i == ""
        #= none:3 =#
        error("This function require credential")
    end
    #= none:6 =#
    header = Dict("Content-Type" => "application/json")
    #= none:8 =#
    params = Dict((lowercase(string(key)) => getfield(params, key) for key = propertynames(params))) |> (x->begin
                    #= none:8 =#
                    filter((t->begin
                                    #= none:8 =#
                                    t.second != nothing
                                end), x) |> JSON.json
                end)
    #= none:9 =#
    request = HTTP.post("https://$(server)/api/i/update", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
