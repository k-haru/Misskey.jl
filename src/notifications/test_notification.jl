@kwdef struct test_notification_params
i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *write:notifications*
=#
function test_notification(params::test_notification_params)
    if params.i == "" && true
        error("/notifications/test-notification: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/notifications/test-notification"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

