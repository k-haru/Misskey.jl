@kwdef struct find_params
Name::Union{Nothing, String} = nothing
FolderId::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
Search for a drive file by the given parameters.

**Credential required**: *Yes* / **Permission**: *read:drive*
=#
function find(params::find_params)
    if params.i == "" && true
        error("/drive/files/find: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/drive/files/find"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

