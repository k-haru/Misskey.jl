@kwdef struct attached_notes_params
SinceId::Union{Nothing, String} = nothing
FileId::Union{Nothing, String} = nothing
UntilId::Union{Nothing, String} = nothing
Limit::Union{Nothing, Int64} = 10

i::String = ""
end

#=                     
Find the notes to which the given file is attached.

**Credential required**: *Yes* / **Permission**: *read:drive*
=#
function attached_notes(params::attached_notes_params)
    if params.i == "" && true
        error("/drive/files/attached-notes: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/drive/files/attached-notes"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

