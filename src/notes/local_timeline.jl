#= none:1 =# @kwdef struct local_timeline_params
        #= none:2 =#
        WithFiles::Union{Nothing, Bool} = false
        #= none:3 =#
        ExcludeNsfw::Union{Nothing, Bool} = false
        #= none:4 =#
        UntilDate::Union{Nothing, Int64} = nothing
        #= none:5 =#
        SinceId::Union{Nothing, String} = nothing
        #= none:6 =#
        FileType::Union{Nothing, Array} = nothing
        #= none:7 =#
        UntilId::Union{Nothing, String} = nothing
        #= none:8 =#
        SinceDate::Union{Nothing, Int64} = nothing
        #= none:9 =#
        Limit::Union{Nothing, Int64} = 10
        #= none:11 =#
        i::String = ""
    end
"ローカルタイムライン (LTL) を取得します。ローカルタイムラインには、サーバー内の全てのパブリックなノートが含まれます。"
function local_timeline(server::String, params::local_timeline_params)
    #= none:1 =#
    #= none:2 =#
    if false && params.i == ""
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
    request = HTTP.post("https://$(server)/api/notes/local_timeline", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
