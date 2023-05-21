#= none:1 =# @kwdef struct notes_params
        #= none:2 =#
        Local::Union{Nothing, Bool} = false
        #= none:3 =#
        WithFiles::Union{Nothing, Bool} = nothing
        #= none:4 =#
        Reply::Union{Nothing, Bool} = nothing
        #= none:5 =#
        SinceId::Union{Nothing, String} = nothing
        #= none:6 =#
        UntilId::Union{Nothing, String} = nothing
        #= none:7 =#
        Poll::Union{Nothing, Bool} = nothing
        #= none:8 =#
        Renote::Union{Nothing, Bool} = nothing
        #= none:9 =#
        Limit::Union{Nothing, Int64} = 10
        #= none:11 =#
        i::String = ""
    end
"ノート一覧を取得します。"
function notes(server::String, params::notes_params)
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
    request = HTTP.post("https://$(server)/api/notes", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
