#= none:1 =# @kwdef struct timeline_params
        #= none:2 =#
        IncludeMyRenotes::Union{Nothing, Bool} = true
        #= none:3 =#
        WithFiles::Union{Nothing, Bool} = false
        #= none:4 =#
        UntilDate::Union{Nothing, Int64} = nothing
        #= none:5 =#
        SinceId::Union{Nothing, String} = nothing
        #= none:6 =#
        UntilId::Union{Nothing, String} = nothing
        #= none:7 =#
        IncludeRenotedMyNotes::Union{Nothing, Bool} = true
        #= none:8 =#
        IncludeLocalRenotes::Union{Nothing, Bool} = true
        #= none:9 =#
        SinceDate::Union{Nothing, Int64} = nothing
        #= none:10 =#
        Limit::Union{Nothing, Int64} = 10
        #= none:12 =#
        i::String = ""
    end
"ホームタイムライン (HTL) を取得します。ホームタイムラインは、自分のフォローしているユーザーのノートが含まれます。"
function timeline(server::String, params::timeline_params)
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
    request = HTTP.post("https://$(server)/api/notes/timeline", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
