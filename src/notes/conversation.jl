#= none:1 =# @kwdef struct conversation_params
        #= none:2 =#
        Offset::Union{Nothing, Int64} = 0
        #= none:3 =#
        NoteId::Union{Nothing, String} = nothing
        #= none:4 =#
        Limit::Union{Nothing, Int64} = 10
        #= none:6 =#
        i::String = ""
    end
"関連するノートを取得します。"
function conversation(server::String, params::conversation_params)
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
    request = HTTP.post("https://$(server)/api/notes/conversation", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
