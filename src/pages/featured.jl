#= none:1 =# @kwdef struct featured_params
        #= none:3 =#
        i::String = ""
    end
"いいね数の上位10ページを取得します。いいねをもらったページの数が10に満たない場合は、それらすべてが返されます。"
function featured(server::String, params::featured_params)
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
    request = HTTP.post("https://$(server)/api/pages/featured", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
