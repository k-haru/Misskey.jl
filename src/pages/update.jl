@kwdef struct update_params
EyeCatchingImageId::Union{Nothing, String} = nothing
HideTitleWhenPinned::Union{Nothing, Bool} = nothing
Name::Union{Nothing, String} = nothing
Variables::Union{Nothing, Array} = nothing
Font::Union{Nothing, String} = nothing
PageId::Union{Nothing, String} = nothing
Summary::Union{Nothing, String} = nothing
AlignCenter::Union{Nothing, Bool} = nothing
Content::Union{Nothing, Array} = nothing
Script::Union{Nothing, String} = nothing
Title::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *write:pages*
=#
function update(params::update_params)
    if params.i == "" && true
        error("/pages/update: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/pages/update"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

