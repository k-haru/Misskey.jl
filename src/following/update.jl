@kwdef struct update_params
UserId::Union{Nothing, String} = nothing
Notify::Union{Nothing, String} = nothing
WithReplies::Union{Nothing, Bool} = nothing

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *write:following*
=#
function update(params::update_params)
    if params.i == "" && true
        error("/following/update: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/following/update"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end
