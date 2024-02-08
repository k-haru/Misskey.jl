# THIS FILE IS GENERATED BY MACRO
@kwdef struct add_note_params
ClipId::Union{Nothing, String} = nothing
NoteId::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *write:account*
=#
function add_note(server,params::add_note_params)
    if params.i == "" && true
        error("/clips/add-note: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = string("https://",server,"/api","/clips/add-note")
    params = Dict(lowercasefirst(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

