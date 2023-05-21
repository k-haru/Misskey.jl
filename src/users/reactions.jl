#= none:1 =# @kwdef struct reactions_params
        #= none:2 =#
        UserId::Union{Nothing, String} = nothing
        #= none:3 =#
        UntilDate::Union{Nothing, Int64} = nothing
        #= none:4 =#
        SinceId::Union{Nothing, String} = nothing
        #= none:5 =#
        UntilId::Union{Nothing, String} = nothing
        #= none:6 =#
        SinceDate::Union{Nothing, Int64} = nothing
        #= none:7 =#
        Limit::Union{Nothing, Int64} = 10
        #= none:9 =#
        i::String = ""
    end
"ユーザーがつけたリアクションを取得します。"
function reactions(server::String, params::reactions_params)
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
    request = HTTP.post("https://$(server)/api/users/reactions", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
