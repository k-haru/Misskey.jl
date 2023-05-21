#= none:1 =# @kwdef struct update_params
        #= none:2 =#
        Memo::Union{Nothing, String} = nothing
        #= none:3 =#
        Place::Union{Nothing, String} = nothing
        #= none:4 =#
        Priority::Union{Nothing, String} = nothing
        #= none:5 =#
        ImageUrl::Union{Nothing, String} = nothing
        #= none:6 =#
        Ratio::Union{Nothing, Int64} = nothing
        #= none:7 =#
        Id::Union{Nothing, String} = nothing
        #= none:8 =#
        ExpiresAt::Union{Nothing, Int64} = nothing
        #= none:9 =#
        Url::Union{Nothing, String} = nothing
        #= none:11 =#
        i::String = ""
    end
""
function update(server::String, params::update_params)
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
    request = HTTP.post("https://$(server)/api/admin/ad/update", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
