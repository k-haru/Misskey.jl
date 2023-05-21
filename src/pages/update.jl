#= none:1 =# @kwdef struct update_params
        #= none:2 =#
        Summary::Union{Nothing, String} = nothing
        #= none:3 =#
        AlignCenter::Union{Nothing, Bool} = nothing
        #= none:4 =#
        Content::Union{Nothing, Array} = nothing
        #= none:5 =#
        Script::Union{Nothing, String} = nothing
        #= none:6 =#
        EyeCatchingImageId::Union{Nothing, String} = nothing
        #= none:7 =#
        HideTitleWhenPinned::Union{Nothing, Bool} = nothing
        #= none:8 =#
        Name::Union{Nothing, String} = nothing
        #= none:9 =#
        Variables::Union{Nothing, Array} = nothing
        #= none:10 =#
        Font::Union{Nothing, String} = nothing
        #= none:11 =#
        Title::Union{Nothing, String} = nothing
        #= none:12 =#
        PageId::Union{Nothing, String} = nothing
        #= none:14 =#
        i::String = ""
    end
"ページのコンテンツ・属性を変更します。"
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
    request = HTTP.post("https://$(server)/api/pages/update", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
