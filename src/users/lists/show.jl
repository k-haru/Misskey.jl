@kwdef struct show_params
ListId::Union{Nothing, String} = nothing
ForPublic::Union{Nothing, Bool} = false

i::String = ""
end

#=                     
Show the properties of a list.

**Credential required**: *No* / **Permission**: *read:account*
=#
function show(params::show_params)
    if params.i == "" && false
        error("/users/lists/show: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/users/lists/show"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

