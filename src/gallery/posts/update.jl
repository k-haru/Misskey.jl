#= none:1 =# @kwdef struct update_params
        #= none:2 =#
        FileIds::Union{Nothing, Array} = nothing
        #= none:3 =#
        IsSensitive::Union{Nothing, Bool} = false
        #= none:4 =#
        Title::Union{Nothing, String} = nothing
        #= none:5 =#
        Description::Union{Nothing, String} = nothing
        #= none:6 =#
        PostId::Union{Nothing, String} = nothing
        #= none:8 =#
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
    request = HTTP.post("https://$(server)/api/gallery/posts/update", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
