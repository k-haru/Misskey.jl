#= none:1 =# @kwdef struct remove_note_params
        #= none:2 =#
        ClipId::Union{Nothing, String} = nothing
        #= none:3 =#
        NoteId::Union{Nothing, String} = nothing
        #= none:5 =#
        i::String = ""
    end
"ノートをクリップから削除します。ノート自身は削除されません。"
function remove_note(server::String, params::remove_note_params)
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
    request = HTTP.post("https://$(server)/api/clips/remove_note", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
