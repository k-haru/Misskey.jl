@kwdef struct test_params
String::Union{Nothing, String} = nothing
Default::Union{Nothing, String} = "hello"
NullableDefault::Union{Nothing, String} = "hello"
Required::Union{Nothing, Bool} = nothing
Id::Union{Nothing, String} = nothing

i::String = ""
end

#=                     
Endpoint for testing input validation.

**Credential required**: *No*
=#
function test(params::test_params)
    if params.i == "" && false
        error("/test: This function require credential")
    end
    header = Dict("Content-Type" => "application/json")
    url = "https://misskey.io/api/test"
    params = Dict(lowercase(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
    request = HTTP.post(url, header, params)
    request.body |> String |> JSON.parse
end

