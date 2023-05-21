#= none:1 =# @kwdef struct drive_capacity_override_params
        #= none:2 =#
        UserId::Union{Nothing, String} = nothing
        #= none:3 =#
        OverrideMb::Union{Nothing, Number} = nothing
        #= none:5 =#
        i::String = ""
    end
""
function drive_capacity_override(server::String, params::drive_capacity_override_params)
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
    request = HTTP.post("https://$(server)/api/admin/drive_capacity_override", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
