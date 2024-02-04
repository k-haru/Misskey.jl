@kwdef struct abuse_user_reports_params
State::Union{Nothing, String} = nothing
TargetUserOrigin::Union{Nothing, String} = "combined"
Forwarded::Union{Nothing, Bool} = false
ReporterOrigin::Union{Nothing, String} = "combined"
SinceId::Union{Nothing, String} = nothing
UntilId::Union{Nothing, String} = nothing
Category::Union{Nothing, String} = nothing
Limit::Union{Nothing, Int64} = 10

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *read:admin:abuse-user-reports*
=#
function abuse_user_reports(params::abuse_user_reports_params)
    if params.i == "" && true
        error("/admin/abuse-user-reports: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/admin/abuse-user-reports"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

