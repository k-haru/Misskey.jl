# THIS FILE IS GENERATED BY MACRO
@kwdef struct conversation_params
Offset::Union{Nothing, Int64} = 0
NoteId::Union{Nothing, String} = nothing
Limit::Union{Nothing, Int64} = 10

i::String = ""
end

#=                     
No description provided.

**Credential required**: *No*
=#
function conversation(server,params::conversation_params)
    if params.i == "" && false
        error("/notes/conversation: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = string("https://",server,"/api","/notes/conversation")
    params = Dict(lowercasefirst(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

