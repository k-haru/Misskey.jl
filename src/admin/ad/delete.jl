#= none:1 =# @kwdef struct delete_params
        #= none:2 =#
        Id::Union{Nothing, String} = nothing
        #= none:4 =#
        i::String = ""
    end
""
function delete(server::String, params::delete_params)
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
    request = HTTP.post("https://$(server)/api/admin/ad/delete", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
