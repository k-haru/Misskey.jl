@kwdef struct instances_params
Blocked::Union{Nothing, Bool} = nothing
NotResponding::Union{Nothing, Bool} = nothing
Federating::Union{Nothing, Bool} = nothing
Suspended::Union{Nothing, Bool} = nothing
Offset::Union{Nothing, Int64} = 0
Subscribing::Union{Nothing, Bool} = nothing
Publishing::Union{Nothing, Bool} = nothing
Host::Union{Nothing, String} = nothing
Sort::Union{Nothing, String} = nothing
Silenced::Union{Nothing, Bool} = nothing
Limit::Union{Nothing, Int64} = 30

i::String = ""
end

#=                     
No description provided.

**Credential required**: *No*
=#
function instances(params::instances_params)
    if params.i == "" && false
        error("/federation/instances: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/federation/instances"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

