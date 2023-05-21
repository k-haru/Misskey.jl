#= none:1 =# @kwdef struct users_params
        #= none:2 =#
        State::Union{Nothing, String} = "all"
        #= none:3 =#
        Origin::Union{Nothing, String} = "local"
        #= none:4 =#
        Offset::Union{Nothing, Int64} = 0
        #= none:5 =#
        Sort::Union{Nothing, String} = nothing
        #= none:6 =#
        Hostname::Union{Nothing, String} = nothing
        #= none:7 =#
        Limit::Union{Nothing, Int64} = 10
        #= none:9 =#
        i::String = ""
    end
""
function users(server::String, params::users_params)
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
    request = HTTP.post("https://$(server)/api/users", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
