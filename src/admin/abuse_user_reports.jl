#= none:1 =# @kwdef struct abuse_user_reports_params
        #= none:2 =#
        State::Union{Nothing, String} = nothing
        #= none:3 =#
        TargetUserOrigin::Union{Nothing, String} = "combined"
        #= none:4 =#
        Forwarded::Union{Nothing, Bool} = false
        #= none:5 =#
        ReporterOrigin::Union{Nothing, String} = "combined"
        #= none:6 =#
        SinceId::Union{Nothing, String} = nothing
        #= none:7 =#
        UntilId::Union{Nothing, String} = nothing
        #= none:8 =#
        Limit::Union{Nothing, Int64} = 10
        #= none:10 =#
        i::String = ""
    end
""
function abuse_user_reports(server::String, params::abuse_user_reports_params)
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
    request = HTTP.post("https://$(server)/api/admin/abuse_user_reports", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
