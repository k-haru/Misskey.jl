#= none:1 =# @kwdef struct update_params
        #= none:2 =#
        Name::Union{Nothing, String} = nothing
        #= none:3 =#
        Secret::Union{Nothing, String} = nothing
        #= none:4 =#
        Active::Union{Nothing, Bool} = nothing
        #= none:5 =#
        On::Union{Nothing, Array} = nothing
        #= none:6 =#
        Url::Union{Nothing, String} = nothing
        #= none:7 =#
        WebhookId::Union{Nothing, String} = nothing
        #= none:9 =#
        i::String = ""
    end
"Webhookの設定を更新します。"
function update(server::String, params::update_params)
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
    request = HTTP.post("https://$(server)/api/i/webhooks/update", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
