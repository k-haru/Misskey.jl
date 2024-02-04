@kwdef struct request_reset_password_params
Username::Union{Nothing, String} = nothing
Email::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
Request a users password to be reset.

**Credential required**: *No*
=#
function request_reset_password(params::request_reset_password_params)
    if params.i == "" && false
        error("/request-reset-password: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/request-reset-password"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

