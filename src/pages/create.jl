@kwdef struct create_params
Summary::Union{Nothing, String} = nothing
Name::Union{Nothing, String} = nothing
AlignCenter::Union{Nothing, Bool} = false
Content::Union{Nothing, Array} = nothing
Variables::Union{Nothing, Array} = nothing
Script::Union{Nothing, String} = nothing
Font::Union{Nothing, String} = "sans-serif"
Title::Union{Nothing, String} = nothing
EyeCatchingImageId::Union{Nothing, String} = nothing
HideTitleWhenPinned::Union{Nothing, Bool} = false

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *write:pages*
=#
function create(params::create_params)
    if params.i == "" && true
        error("/pages/create: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/pages/create"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

