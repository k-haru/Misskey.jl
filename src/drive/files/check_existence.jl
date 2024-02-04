@kwdef struct check_existence_params
Md5::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
Check if a given file exists.

**Credential required**: *Yes* / **Permission**: *read:drive*
=#
function check_existence(params::check_existence_params)
    if params.i == "" && true
        error("/drive/files/check-existence: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/drive/files/check-existence"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

