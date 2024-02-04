@kwdef struct send_email_params
To::Union{Nothing, String} = nothing
Text::Union{Nothing, String} = nothing
Subject::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *write:admin:send-email*
=#
function send_email(params::send_email_params)
    if params.i == "" && true
        error("/admin/send-email: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/admin/send-email"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

