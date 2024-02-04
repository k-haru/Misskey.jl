@kwdef struct notes_params
Local::Union{Nothing, Bool} = false
WithFiles::Union{Nothing, Bool} = nothing
Reply::Union{Nothing, Bool} = nothing
SinceId::Union{Nothing, String} = nothing
UntilId::Union{Nothing, String} = nothing
Poll::Union{Nothing, Bool} = nothing
Renote::Union{Nothing, Bool} = nothing
Limit::Union{Nothing, Int64} = 10

i::String = ""
end

#=                     
No description provided.

**Credential required**: *No*
=#
function notes(params::notes_params)
    if params.i == "" && false
        error("/notes: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/notes"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

