#= none:1 =# @kwdef struct search_by_tag_params
        #= none:2 =#
        WithFiles::Union{Nothing, Bool} = false
        #= none:3 =#
        Reply::Union{Nothing, Bool} = nothing
        #= none:4 =#
        SinceId::Union{Nothing, String} = nothing
        #= none:5 =#
        UntilId::Union{Nothing, String} = nothing
        #= none:6 =#
        Poll::Union{Nothing, Bool} = nothing
        #= none:7 =#
        Renote::Union{Nothing, Bool} = nothing
        #= none:8 =#
        Limit::Union{Nothing, Int64} = 10
        #= none:10 =#
        i::String = ""
    end
"指定されたハッシュタグが付けられたノートを取得します。複数のハッシュタグを組み合わせた検索条件を設定できます。"
function search_by_tag(server::String, params::search_by_tag_params)
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
    request = HTTP.post("https://$(server)/api/notes/search_by_tag", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
