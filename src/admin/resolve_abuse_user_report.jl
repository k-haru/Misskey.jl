@kwdef struct resolve_abuse_user_report_params
Forward::Union{Nothing, Bool} = false
ReportId::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *write:admin:resolve-abuse-user-report*
=#
function resolve_abuse_user_report(params::resolve_abuse_user_report_params)
    if params.i == "" && true
        error("/admin/resolve-abuse-user-report: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/admin/resolve-abuse-user-report"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

