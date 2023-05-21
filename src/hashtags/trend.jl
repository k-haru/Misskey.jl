#= none:1 =# @kwdef struct trend_params
        #= none:3 =#
        i::String = ""
    end
"トレンドにあるハッシュタグを取得します。"
function trend(server::String, params::trend_params)
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
    request = HTTP.post("https://$(server)/api/hashtags/trend", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
