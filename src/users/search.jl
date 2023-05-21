#= none:1 =# @kwdef struct search_params
        #= none:2 =#
        Origin::Union{Nothing, String} = "combined"
        #= none:3 =#
        Detail::Union{Nothing, Bool} = true
        #= none:4 =#
        Offset::Union{Nothing, Int64} = 0
        #= none:5 =#
        Query::Union{Nothing, String} = nothing
        #= none:6 =#
        Limit::Union{Nothing, Int64} = 10
        #= none:8 =#
        i::String = ""
    end
"与えられたクエリからユーザーを検索します。30日間アクティブでないユーザーや、凍結されているユーザーは除外されます。結果はユーザーの最後の投稿が新しい順にソートされます。"
function search(server::String, params::search_params)
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
    request = HTTP.post("https://$(server)/api/users/search", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
