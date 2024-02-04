@kwdef struct update_params
Memo::Union{Nothing, String} = nothing
Place::Union{Nothing, String} = nothing
Priority::Union{Nothing, String} = nothing
ImageUrl::Union{Nothing, String} = nothing
Ratio::Union{Nothing, Int64} = nothing
Id::Union{Nothing, String} = nothing
DayOfWeek::Union{Nothing, Int64} = nothing
ExpiresAt::Union{Nothing, Int64} = nothing
StartsAt::Union{Nothing, Int64} = nothing
Url::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
No description provided.

**Credential required**: *Yes* / **Permission**: *write:admin:ad*
=#
function update(params::update_params)
    if params.i == "" && true
        error("/admin/ad/update: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/admin/ad/update"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

