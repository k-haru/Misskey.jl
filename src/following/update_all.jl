# THIS FILE IS GENERATED BY MACRO
@kwdef struct update_all_params
Notify::Union{Nothing, String} = nothing
WithReplies::Union{Nothing, Bool} = nothing

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *write:following*
=#
function update_all(server,params::update_all_params)
    if params.i == "" && true
        error("/following/update-all: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = string("https://",server,"/api","/following/update-all")
    params = Dict(lowercasefirst(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

