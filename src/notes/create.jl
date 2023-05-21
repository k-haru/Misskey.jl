#= none:1 =# @kwdef struct create_params
        #= none:2 =#
        Visibility::Union{Nothing, String} = "public"
        #= none:3 =#
        ReplyId::Union{Nothing, String} = nothing
        #= none:4 =#
        LocalOnly::Union{Nothing, Bool} = false
        #= none:5 =#
        NoExtractHashtags::Union{Nothing, Bool} = false
        #= none:6 =#
        RenoteId::Union{Nothing, String} = nothing
        #= none:7 =#
        VisibleUserIds::Union{Nothing, Array} = nothing
        #= none:8 =#
        FileIds::Union{Nothing, Array} = nothing
        #= none:9 =#
        Cw::Union{Nothing, String} = nothing
        #= none:10 =#
        NoExtractEmojis::Union{Nothing, Bool} = false
        #= none:11 =#
        ChannelId::Union{Nothing, String} = nothing
        #= none:12 =#
        Poll::Union{Nothing, Dict} = nothing
        #= none:13 =#
        NoExtractMentions::Union{Nothing, Bool} = false
        #= none:14 =#
        Text::Union{Nothing, String} = nothing
        #= none:15 =#
        MediaIds::Union{Nothing, Array} = nothing
        #= none:17 =#
        i::String = ""
    end
"ノートを作成します。返信やRenoteもこのAPIで行います。"
function create(server::String, params::create_params)
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
    request = HTTP.post("https://$(server)/api/notes/create", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
