@kwdef struct clean_remote_files_params
i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *write:admin:drive*
=#
function clean_remote_files(params::clean_remote_files_params)
    if params.i == "" && true
        error("/admin/drive/clean-remote-files: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/admin/drive/clean-remote-files"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

