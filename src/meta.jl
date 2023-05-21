#= none:1 =# @kwdef struct meta_params
        #= none:2 =#
        Detail::Union{Nothing, Bool} = true
        #= none:4 =#
        i::String = ""
    end
"自サーバー情報を取得します。"
function meta(server::String, params::meta_params)
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
    request = HTTP.post("https://$(server)/api/meta", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
