#= none:1 =# @kwdef struct renotes_params
        #= none:2 =#
        SinceId::Union{Nothing, String} = nothing
        #= none:3 =#
        UntilId::Union{Nothing, String} = nothing
        #= none:4 =#
        NoteId::Union{Nothing, String} = nothing
        #= none:5 =#
        Limit::Union{Nothing, Int64} = 10
        #= none:7 =#
        i::String = ""
    end
"ノートに対するRenote一覧を取得します。"
function renotes(server::String, params::renotes_params)
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
    request = HTTP.post("https://$(server)/api/notes/renotes", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
