# THIS FILE IS GENERATED BY MACRO
@kwdef struct deliver_delayed_params
i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *read:admin:queue*
=#
function deliver_delayed(server,params::deliver_delayed_params)
    if params.i == "" && true
        error("/admin/queue/deliver-delayed: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = string("https://",server,"/api","/admin/queue/deliver-delayed")
    params = Dict(lowercasefirst(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

