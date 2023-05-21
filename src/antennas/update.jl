#= none:1 =# @kwdef struct update_params
        #= none:2 =#
        WithFile::Union{Nothing, Bool} = nothing
        #= none:3 =#
        UserListId::Union{Nothing, String} = nothing
        #= none:4 =#
        Users::Union{Nothing, Array} = nothing
        #= none:5 =#
        Keywords::Union{Nothing, Array} = nothing
        #= none:6 =#
        WithReplies::Union{Nothing, Bool} = nothing
        #= none:7 =#
        AntennaId::Union{Nothing, String} = nothing
        #= none:8 =#
        Name::Union{Nothing, String} = nothing
        #= none:9 =#
        ExcludeKeywords::Union{Nothing, Array} = nothing
        #= none:10 =#
        Src::Union{Nothing, String} = nothing
        #= none:11 =#
        Notify::Union{Nothing, Bool} = nothing
        #= none:12 =#
        CaseSensitive::Union{Nothing, Bool} = nothing
        #= none:14 =#
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
    request = HTTP.post("https://$(server)/api/antennas/update", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
