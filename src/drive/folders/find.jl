#= none:1 =# @kwdef struct find_params
        #= none:2 =#
        ParentId::Union{Nothing, String} = nothing
        #= none:3 =#
        Name::Union{Nothing, String} = nothing
        #= none:5 =#
        i::String = ""
    end
"ログイン中のユーザのドライブにあるフォルダーを検索します。"
function find(server::String, params::find_params)
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
    request = HTTP.post("https://$(server)/api/drive/folders/find", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
