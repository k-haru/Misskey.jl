@kwdef struct update_params
FileIds::Union{Nothing, Array} = nothing
IsSensitive::Union{Nothing, Bool} = false
Title::Union{Nothing, String} = nothing
Description::Union{Nothing, String} = nothing
PostId::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *write:gallery*
=#
function update(params::update_params)
    if params.i == "" && true
        error("/gallery/posts/update: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/gallery/posts/update"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

