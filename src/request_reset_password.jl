#= none:1 =# @kwdef struct request_reset_password_params
        #= none:2 =#
        Username::Union{Nothing, String} = nothing
        #= none:3 =#
        Email::Union{Nothing, String} = nothing
        #= none:5 =#
        i::String = ""
    end
""
function request_reset_password(server::String, params::request_reset_password_params)
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
    request = HTTP.post("https://$(server)/api/request_reset_password", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
