#= none:1 =# @kwdef struct upload_from_url_params
        #= none:2 =#
        FolderId::Union{Nothing, String} = nothing
        #= none:3 =#
        Marker::Union{Nothing, String} = nothing
        #= none:4 =#
        IsSensitive::Union{Nothing, Bool} = false
        #= none:5 =#
        Force::Union{Nothing, Bool} = false
        #= none:6 =#
        Url::Union{Nothing, String} = nothing
        #= none:7 =#
        Comment::Union{Nothing, String} = nothing
        #= none:9 =#
        i::String = ""
    end
"ファイルのURLを指定して、ログイン中のユーザのドライブにアップロードします。"
function upload_from_url(server::String, params::upload_from_url_params)
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
    request = HTTP.post("https://$(server)/api/drive/files/upload_from_url", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
