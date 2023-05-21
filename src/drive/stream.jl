#= none:1 =# @kwdef struct stream_params
        #= none:2 =#
        SinceId::Union{Nothing, String} = nothing
        #= none:3 =#
        UntilId::Union{Nothing, String} = nothing
        #= none:4 =#
        Type::Union{Nothing, String} = nothing
        #= none:5 =#
        Limit::Union{Nothing, Int64} = 10
        #= none:7 =#
        i::String = ""
    end
"ログイン中のユーザーのドライブにあるファイルの一覧を、フォルダを横断して取得します。"
function stream(server::String, params::stream_params)
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
    request = HTTP.post("https://$(server)/api/drive/stream", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
