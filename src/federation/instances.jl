#= none:1 =# @kwdef struct instances_params
        #= none:2 =#
        Publishing::Union{Nothing, Bool} = nothing
        #= none:3 =#
        Blocked::Union{Nothing, Bool} = nothing
        #= none:4 =#
        Host::Union{Nothing, String} = nothing
        #= none:5 =#
        NotResponding::Union{Nothing, Bool} = nothing
        #= none:6 =#
        Offset::Union{Nothing, Int64} = 0
        #= none:7 =#
        Sort::Union{Nothing, String} = nothing
        #= none:8 =#
        Federating::Union{Nothing, Bool} = nothing
        #= none:9 =#
        Suspended::Union{Nothing, Bool} = nothing
        #= none:10 =#
        Subscribing::Union{Nothing, Bool} = nothing
        #= none:11 =#
        Limit::Union{Nothing, Int64} = 30
        #= none:13 =#
        i::String = ""
    end
"認識している他のサーバーの一覧を取得します。各パラメータを指定しない場合、そのパラメータでの絞り込みは行われません。複数のパラメータを指定すると、それらの条件をすべて満たすサーバーを検索します。"
function instances(server::String, params::instances_params)
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
    request = HTTP.post("https://$(server)/api/federation/instances", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
