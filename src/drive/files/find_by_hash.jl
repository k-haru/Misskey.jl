#= none:1 =# @kwdef struct find_by_hash_params
        #= none:2 =#
        Md5::Union{Nothing, String} = nothing
        #= none:4 =#
        i::String = ""
    end
"与えられたハッシュ値を持つファイルの一覧をログイン中のユーザのドライブから取得します。ファイルが存在するかどうかだけを知りたい場合には、 check-existenceを使用してください。"
function find_by_hash(server::String, params::find_by_hash_params)
    #= none:1 =#
    #= none:2 =#
    if true && params.i == ""
        #= none:3 =#
        error("This function require credential")
    end
    #= none:6 =#
    header = Dict("Content-Type" => "application/json")
    #= none:8 =#
    params = Dict((lowercase(string(key)) => getfield(params, key) for key = propertynames(params))) |> (x->begin
                    #= none:8 =#
                    filter((t->begin
                                    #= none:8 =#
                                    t.second != nothing
                                end), x) |> JSON.json
                end)
    #= none:9 =#
    request = HTTP.post("https://$(server)/api/drive/files/find_by_hash", header, params)
    #= none:10 =#
    (request.body |> String) |> JSON.parse
end
