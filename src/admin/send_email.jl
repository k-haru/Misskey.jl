#= none:1 =# @kwdef struct send_email_params
        #= none:2 =#
        To::Union{Nothing, String} = nothing
        #= none:3 =#
        Text::Union{Nothing, String} = nothing
        #= none:4 =#
        Subject::Union{Nothing, String} = nothing
        #= none:6 =#
        i::String = ""
    end
""
function send_email(server::String, params::send_email_params)
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
    request = HTTP.post("https://$(server)/api/admin/send_email", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
