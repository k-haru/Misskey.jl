@kwdef struct replies_params
SinceId::Union{Nothing, String} = nothing
UntilId::Union{Nothing, String} = nothing
NoteId::Union{Nothing, String} = nothing
Limit::Union{Nothing, Int64} = 10

i::String = ""
end

#=                     
No description provided.

**Credential required**: *No*
=#
function replies(params::replies_params)
    if params.i == "" && false
        error("/notes/replies: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/notes/replies"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

