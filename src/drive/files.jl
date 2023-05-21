#= none:1 =# @kwdef struct files_params
        #= none:2 =#
        FolderId::Union{Nothing, String} = nothing
        #= none:3 =#
        SinceId::Union{Nothing, String} = nothing
        #= none:4 =#
        UntilId::Union{Nothing, String} = nothing
        #= none:5 =#
        Type::Union{Nothing, String} = nothing
        #= none:6 =#
        Limit::Union{Nothing, Int64} = 10
        #= none:8 =#
        i::String = ""
    end
"ログイン中のユーザのドライブ以下、指定のフォルダーあるいはルート階層にある、ファイルの一覧を取得します。"
function files(server::String, params::files_params)
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
    request = HTTP.post("https://$(server)/api/drive/files", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
