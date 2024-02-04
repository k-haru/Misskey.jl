@kwdef struct list_params
AttachedToLocalUserOnly::Union{Nothing, Bool} = false
AttachedToRemoteUserOnly::Union{Nothing, Bool} = false
AttachedToUserOnly::Union{Nothing, Bool} = false
Sort::Union{Nothing, String} = nothing
Limit::Union{Nothing, Int64} = 10

i::String = ""
end

#=                     
No description provided.

**Credential required**: *No*
=#
function list(params::list_params)
    if params.i == "" && false
        error("/hashtags/list: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/hashtags/list"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

