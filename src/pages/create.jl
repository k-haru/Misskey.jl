#= none:1 =# @kwdef struct create_params
        #= none:2 =#
        Summary::Union{Nothing, String} = nothing
        #= none:3 =#
        Name::Union{Nothing, String} = nothing
        #= none:4 =#
        AlignCenter::Union{Nothing, Bool} = false
        #= none:5 =#
        Content::Union{Nothing, Array} = nothing
        #= none:6 =#
        Variables::Union{Nothing, Array} = nothing
        #= none:7 =#
        Script::Union{Nothing, String} = nothing
        #= none:8 =#
        Font::Union{Nothing, String} = "sans-serif"
        #= none:9 =#
        Title::Union{Nothing, String} = nothing
        #= none:10 =#
        EyeCatchingImageId::Union{Nothing, String} = nothing
        #= none:11 =#
        HideTitleWhenPinned::Union{Nothing, Bool} = false
        #= none:13 =#
        i::String = ""
    end
"ページを作成します。"
function create(server::String, params::create_params)
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
    request = HTTP.post("https://$(server)/api/pages/create", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
