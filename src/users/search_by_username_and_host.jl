#= none:1 =# @kwdef struct search_by_username_and_host_params
        #= none:2 =#
        Host::Union{Nothing, String} = nothing
        #= none:3 =#
        Detail::Union{Nothing, Bool} = true
        #= none:4 =#
        Username::Union{Nothing, String} = nothing
        #= none:5 =#
        Limit::Union{Nothing, Int64} = 10
        #= none:7 =#
        i::String = ""
    end
"ユーザー名・ホスト名からユーザーを検索します。30日間投稿のないユーザーや、凍結されているユーザーは除外されます。結果はユーザーの最後の投稿が新しい順にソートされます。ログイン中であれば（＝認証情報が送信されれば）、フォローしているユーザーを優先的に検索します。"
function search_by_username_and_host(server::String, params::search_by_username_and_host_params)
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
    request = HTTP.post("https://$(server)/api/users/search_by_username_and_host", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
