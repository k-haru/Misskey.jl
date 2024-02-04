@kwdef struct show_params
FileId::Union{Nothing, String} = nothing
Url::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
Show the properties of a drive file.

**Credential required**: *Yes* / **Permission**: *read:drive*
=#
function show(params::show_params)
    if params.i == "" && true
        error("/drive/files/show: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/drive/files/show"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

