@kwdef struct report_abuse_params
UserId::Union{Nothing, String} = nothing
Category::Union{Nothing, String} = "other"
Comment::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
File a report.

**Credential required**: *Yes* / **Permission**: *write:report-abuse*
=#
function report_abuse(params::report_abuse_params)
    if params.i == "" && true
        error("/users/report-abuse: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/users/report-abuse"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

