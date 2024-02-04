@kwdef struct show_params
NoteId::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
No description provided.

**Credential required**: *No*
=#
function show(params::show_params)
    if params.i == "" && false
        error("/notes/show: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/notes/show"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

