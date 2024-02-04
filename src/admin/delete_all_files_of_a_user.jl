@kwdef struct delete_all_files_of_a_user_params
UserId::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *write:admin:delete-all-files-of-a-user*
=#
function delete_all_files_of_a_user(params::delete_all_files_of_a_user_params)
    if params.i == "" && true
        error("/admin/delete-all-files-of-a-user: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/admin/delete-all-files-of-a-user"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

