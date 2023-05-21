#= none:1 =# @kwdef struct likes_params
        #= none:2 =#
        SinceId::Union{Nothing, String} = nothing
        #= none:3 =#
        UntilId::Union{Nothing, String} = nothing
        #= none:4 =#
        Limit::Union{Nothing, Int64} = 10
        #= none:6 =#
        i::String = ""
    end
"ログイン中のユーザーがギャラリーの投稿につけたいいねを取得します。"
function likes(server::String, params::likes_params)
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
    request = HTTP.post("https://$(server)/api/i/gallery/likes", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
