@kwdef struct search_by_username_and_host_params
Host::Union{Nothing, String} = nothing
Detail::Union{Nothing, Bool} = true
Username::Union{Nothing, String} = nothing
Limit::Union{Nothing, Int64} = 10

i::String = ""
end

#=                     
Search for a user by username and/or host.

**Credential required**: *No*
=#
function search_by_username_and_host(params::search_by_username_and_host_params)
    if params.i == "" && false
        error("/users/search-by-username-and-host: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/users/search-by-username-and-host"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

