@kwdef struct delete_params
FileId::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
Delete an existing drive file.

**Credential required**: *Yes* / **Permission**: *write:drive*
=#
function delete(params::delete_params)
    if params.i == "" && true
        error("/drive/files/delete: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/drive/files/delete"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

