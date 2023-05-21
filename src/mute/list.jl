#= none:1 =# @kwdef struct list_params
        #= none:2 =#
        SinceId::Union{Nothing, String} = nothing
        #= none:3 =#
        UntilId::Union{Nothing, String} = nothing
        #= none:4 =#
        Limit::Union{Nothing, Int64} = 30
        #= none:6 =#
        i::String = ""
    end
"ログイン中のユーザが設定しているミュートの一覧を取得します。"
function list(server::String, params::list_params)
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
    request = HTTP.post("https://$(server)/api/mute/list", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
