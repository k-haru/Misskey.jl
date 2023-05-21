#= none:1 =# @kwdef struct list_params
        #= none:3 =#
        i::String = ""
    end
"ログイン中のユーザーが設定しているWebhookの一覧を取得します。"
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
    request = HTTP.post("https://$(server)/api/i/webhooks/list", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
