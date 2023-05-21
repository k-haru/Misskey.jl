#= none:1 =# @kwdef struct stats_params
        #= none:2 =#
        Limit::Union{Nothing, Int64} = 10
        #= none:4 =#
        i::String = ""
    end
"サーバー・連合の統計を取得します。"
function stats(server::String, params::stats_params)
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
    request = HTTP.post("https://$(server)/api/federation/stats", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
