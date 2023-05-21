#= none:1 =# @kwdef struct recommendation_params
        #= none:2 =#
        Offset::Union{Nothing, Int64} = 0
        #= none:3 =#
        Limit::Union{Nothing, Int64} = 10
        #= none:5 =#
        i::String = ""
    end
"ログイン中のユーザーに対して、フォローをおすすめできるユーザーを取得します。"
function recommendation(server::String, params::recommendation_params)
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
    request = HTTP.post("https://$(server)/api/users/recommendation", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
