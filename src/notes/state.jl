#= none:1 =# @kwdef struct state_params
        #= none:2 =#
        NoteId::Union{Nothing, String} = nothing
        #= none:4 =#
        i::String = ""
    end
"ノートに対するログイン中のユーザによるアクション（お気に入り・ウォッチ・スレッドミュート）を取得します。"
function state(server::String, params::state_params)
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
    request = HTTP.post("https://$(server)/api/notes/state", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
