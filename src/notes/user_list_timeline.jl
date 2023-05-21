#= none:1 =# @kwdef struct user_list_timeline_params
        #= none:2 =#
        IncludeMyRenotes::Union{Nothing, Bool} = true
        #= none:3 =#
        IncludeLocalRenotes::Union{Nothing, Bool} = true
        #= none:4 =#
        WithFiles::Union{Nothing, Bool} = false
        #= none:5 =#
        UntilDate::Union{Nothing, Int64} = nothing
        #= none:6 =#
        SinceId::Union{Nothing, String} = nothing
        #= none:7 =#
        UntilId::Union{Nothing, String} = nothing
        #= none:8 =#
        ListId::Union{Nothing, String} = nothing
        #= none:9 =#
        IncludeRenotedMyNotes::Union{Nothing, Bool} = true
        #= none:10 =#
        SinceDate::Union{Nothing, Int64} = nothing
        #= none:11 =#
        Limit::Union{Nothing, Int64} = 10
        #= none:13 =#
        i::String = ""
    end
"指定したユーザーリストのタイムラインを取得します。"
function user_list_timeline(server::String, params::user_list_timeline_params)
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
    request = HTTP.post("https://$(server)/api/notes/user_list_timeline", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
