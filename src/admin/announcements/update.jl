@kwdef struct update_params
IsActive::Union{Nothing, Bool} = nothing
Display::Union{Nothing, String} = nothing
Silence::Union{Nothing, Bool} = nothing
Icon::Union{Nothing, String} = nothing
Id::Union{Nothing, String} = nothing
ImageUrl::Union{Nothing, String} = nothing
DisplayOrder::Union{Nothing, Number} = 0
NeedConfirmationToRead::Union{Nothing, Bool} = nothing
ForExistingUsers::Union{Nothing, Bool} = nothing
Title::Union{Nothing, String} = nothing
CloseDuration::Union{Nothing, Number} = 0
Text::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *write:admin:announcements*
=#
function update(params::update_params)
    if params.i == "" && true
        error("/admin/announcements/update: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/admin/announcements/update"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

