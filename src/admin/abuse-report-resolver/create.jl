@kwdef struct create_params
Name::Union{Nothing, String} = nothing
Forward::Union{Nothing, Bool} = nothing
TargetUserPattern::Union{Nothing, String} = nothing
ExpiresAt::Union{Nothing, String} = nothing
ReportContentPattern::Union{Nothing, String} = nothing
ReporterPattern::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *write:admin:abuse-report-resolvers*
=#
function create(params::create_params)
    if params.i == "" && true
        error("/admin/abuse-report-resolver/create: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/admin/abuse-report-resolver/create"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

