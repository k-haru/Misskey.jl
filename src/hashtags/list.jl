#= none:1 =# @kwdef struct list_params
        #= none:2 =#
        AttachedToLocalUserOnly::Union{Nothing, Bool} = false
        #= none:3 =#
        AttachedToRemoteUserOnly::Union{Nothing, Bool} = false
        #= none:4 =#
        AttachedToUserOnly::Union{Nothing, Bool} = false
        #= none:5 =#
        Sort::Union{Nothing, String} = nothing
        #= none:6 =#
        Limit::Union{Nothing, Int64} = 10
        #= none:8 =#
        i::String = ""
    end
"ハッシュタグの一覧を取得します。"
function list(server::String, params::list_params)
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
    request = HTTP.post("https://$(server)/api/hashtags/list", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
