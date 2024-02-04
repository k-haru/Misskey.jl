@kwdef struct create_params
Display::Union{Nothing, String} = "normal"
Silence::Union{Nothing, Bool} = false
Icon::Union{Nothing, String} = "info"
ImageUrl::Union{Nothing, String} = nothing
DisplayOrder::Union{Nothing, Number} = 0
NeedConfirmationToRead::Union{Nothing, Bool} = false
UserId::Union{Nothing, String} = nothing
ForExistingUsers::Union{Nothing, Bool} = false
Title::Union{Nothing, String} = nothing
CloseDuration::Union{Nothing, Number} = 0
Text::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *write:admin:announcements*
=#
function create(params::create_params)
    if params.i == "" && true
        error("/admin/announcements/create: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/admin/announcements/create"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

