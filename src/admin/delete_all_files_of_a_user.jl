# THIS FILE IS GENERATED BY MACRO
@kwdef struct delete_all_files_of_a_user_params
UserId::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *write:admin:delete-all-files-of-a-user*
=#
function delete_all_files_of_a_user(server,params::delete_all_files_of_a_user_params)
    if params.i == "" && true
        error("/admin/delete-all-files-of-a-user: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = string("https://",server,"/api","/admin/delete-all-files-of-a-user")
    params = Dict(lowercasefirst(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

