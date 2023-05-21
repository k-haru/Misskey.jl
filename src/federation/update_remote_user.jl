#= none:1 =# @kwdef struct update_remote_user_params
        #= none:2 =#
        UserId::Union{Nothing, String} = nothing
        #= none:4 =#
        i::String = ""
    end
"リモートユーザーの情報を更新します。"
function update_remote_user(server::String, params::update_remote_user_params)
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
    request = HTTP.post("https://$(server)/api/federation/update_remote_user", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
