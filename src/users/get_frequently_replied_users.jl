#= none:1 =# @kwdef struct get_frequently_replied_users_params
        #= none:2 =#
        UserId::Union{Nothing, String} = nothing
        #= none:3 =#
        Limit::Union{Nothing, Int64} = 10
        #= none:5 =#
        i::String = ""
    end
"ユーザーが頻繁にリプライを送信しているユーザーを取得します。最新の1000件のノートを対象に集計を行います。"
function get_frequently_replied_users(server::String, params::get_frequently_replied_users_params)
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
    request = HTTP.post("https://$(server)/api/users/get_frequently_replied_users", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
