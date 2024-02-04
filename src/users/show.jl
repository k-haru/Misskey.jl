@kwdef struct show_params
UserId::Union{Nothing, String} = nothing
Host::Union{Nothing, String} = nothing
UserIds::Union{Nothing, Array} = nothing
Username::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
Show the properties of a user.

**Credential required**: *No*
=#
function show(params::show_params)
    if params.i == "" && false
        error("/users/show: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/users/show"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

