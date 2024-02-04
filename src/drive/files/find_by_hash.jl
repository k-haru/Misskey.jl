@kwdef struct find_by_hash_params
Md5::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
Search for a drive file by a hash of the contents.

**Credential required**: *Yes* / **Permission**: *read:drive*
=#
function find_by_hash(params::find_by_hash_params)
    if params.i == "" && true
        error("/drive/files/find-by-hash: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/drive/files/find-by-hash"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

