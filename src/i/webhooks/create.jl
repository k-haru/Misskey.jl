#= none:1 =# @kwdef struct create_params
        #= none:2 =#
        Name::Union{Nothing, String} = nothing
        #= none:3 =#
        Secret::Union{Nothing, String} = nothing
        #= none:4 =#
        On::Union{Nothing, Array} = nothing
        #= none:5 =#
        Url::Union{Nothing, String} = nothing
        #= none:7 =#
        i::String = ""
    end
"Webhookを作成します。Webhookについての詳細は該当する項目を参照してください。"
function create(server::String, params::create_params)
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
    request = HTTP.post("https://$(server)/api/i/webhooks/create", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
