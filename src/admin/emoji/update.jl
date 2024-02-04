@kwdef struct update_params
RequestedBy::Union{Nothing, String} = nothing
RoleIdsThatCanNotBeUsedThisEmojiAsReaction::Union{Nothing, Array} = nothing
FileId::Union{Nothing, String} = nothing
RoleIdsThatCanBeUsedThisEmojiAsReaction::Union{Nothing, Array} = nothing
Aliases::Union{Nothing, Array} = nothing
Name::Union{Nothing, String} = nothing
Id::Union{Nothing, String} = nothing
Memo::Union{Nothing, String} = nothing
LocalOnly::Union{Nothing, Bool} = nothing
Category::Union{Nothing, String} = nothing
IsSensitive::Union{Nothing, Bool} = nothing
License::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *write:admin:emoji*
=#
function update(params::update_params)
    if params.i == "" && true
        error("/admin/emoji/update: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/admin/emoji/update"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

