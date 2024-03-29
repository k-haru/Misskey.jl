# THIS FILE IS GENERATED BY MACRO
@kwdef struct refresh_remote_instance_metadata_params
Host::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *write:admin:federation*
=#
function refresh_remote_instance_metadata(server,params::refresh_remote_instance_metadata_params)
    if params.i == "" && true
        error("/admin/federation/refresh-remote-instance-metadata: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = string("https://",server,"/api","/admin/federation/refresh-remote-instance-metadata")
    params = Dict(lowercasefirst(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

