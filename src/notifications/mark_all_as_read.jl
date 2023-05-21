#= none:1 =# @kwdef struct mark_all_as_read_params
        #= none:3 =#
        i::String = ""
    end
"ログイン中のユーザーが受け取ったすべての通知を既読にします。"
function mark_all_as_read(server::String, params::mark_all_as_read_params)
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
    request = HTTP.post("https://$(server)/api/notifications/mark_all_as_read", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
