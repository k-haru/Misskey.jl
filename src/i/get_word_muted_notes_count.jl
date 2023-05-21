#= none:1 =# @kwdef struct get_word_muted_notes_count_params
        #= none:3 =#
        i::String = ""
    end
"ログイン中のユーザーの設定によりワードミュートされたノートの数を取得します。"
function get_word_muted_notes_count(server::String, params::get_word_muted_notes_count_params)
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
    request = HTTP.post("https://$(server)/api/i/get_word_muted_notes_count", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
