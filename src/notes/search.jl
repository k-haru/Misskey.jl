#= none:1 =# @kwdef struct search_params
        #= none:2 =#
        UserId::Union{Nothing, String} = nothing
        #= none:3 =#
        Host::Union{Nothing, String} = nothing
        #= none:4 =#
        ChannelId::Union{Nothing, String} = nothing
        #= none:5 =#
        SinceId::Union{Nothing, String} = nothing
        #= none:6 =#
        Offset::Union{Nothing, Int64} = 0
        #= none:7 =#
        UntilId::Union{Nothing, String} = nothing
        #= none:8 =#
        Query::Union{Nothing, String} = nothing
        #= none:9 =#
        Limit::Union{Nothing, Int64} = 10
        #= none:11 =#
        i::String = ""
    end
"ノートを検索します。"
function search(server::String, params::search_params)
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
    request = HTTP.post("https://$(server)/api/notes/search", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
