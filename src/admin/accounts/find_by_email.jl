# THIS FILE IS GENERATED BY MACRO
@kwdef struct find_by_email_params
Email::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *read:admin:account*
=#
function find_by_email(server,params::find_by_email_params)
    if params.i == "" && true
        error("/admin/accounts/find-by-email: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = string("https://",server,"/api","/admin/accounts/find-by-email")
    params = Dict(lowercasefirst(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

