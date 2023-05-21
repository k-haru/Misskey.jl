#= none:1 =# @kwdef struct notifications_params
        #= none:2 =#
        IncludeTypes::Union{Nothing, Array} = nothing
        #= none:3 =#
        UnreadOnly::Union{Nothing, Bool} = false
        #= none:4 =#
        SinceId::Union{Nothing, String} = nothing
        #= none:5 =#
        UntilId::Union{Nothing, String} = nothing
        #= none:6 =#
        MarkAsRead::Union{Nothing, Bool} = true
        #= none:7 =#
        Following::Union{Nothing, Bool} = false
        #= none:8 =#
        ExcludeTypes::Union{Nothing, Array} = nothing
        #= none:9 =#
        Limit::Union{Nothing, Int64} = 10
        #= none:11 =#
        i::String = ""
    end
"通知一覧を取得します。通知の種類をフィルタリングして取得することも可能です。"
function notifications(server::String, params::notifications_params)
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
    request = HTTP.post("https://$(server)/api/i/notifications", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
