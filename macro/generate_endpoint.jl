function generate_endpoint(endpoint, post_data, server)
    description = post_data["description"]
    # responses = post_data["responses"]
    name = endpoint |> splitpath |> last |> x -> replace(x, r"-" => "_")
    path = post_data["operationId"]

    if haskey(post_data, "requestBody")
        request = post_data["requestBody"]
        content = request["content"]
        if haskey(content, "application/json")
            header = Dict("Content-Type" => "application/json")
            schema = content["application/json"]["schema"]
            properties = schema["properties"]
            prop_keys = properties |> keys |> collect
            prop_values = properties |> values |> collect .|> x ->
                              try
                                  x["type"] |> type_to_julia
                              catch
                                  Any
                              end
            prop_defaults = properties |> values |> collect .|>
                            x -> try
                                x["default"]
                            catch
                                nothing
                            end
            prop_initialize = prop_defaults .|> isnothing
            names_types =
                zip(prop_keys, prop_values, prop_initialize, prop_defaults) |>
                collect .|>
                x -> string(
                    uppercasefirst(x[1]),
                    "::",
                    NT(x[2]),
                    begin
                        x[3] ? " = nothing" :
                        " = $(typeof(x[4]) == String ? string("\"",x[4],"\"") : x[4])"
                    end,
                    "\n",
                )
            struct_expr = """
                          @kwdef struct $(string(name, "_params"))
                          $( names_types |> join)
                          i::String = ""
                          end
                          """
        elseif haskey(content, "multipart/form-data")
            header = Dict("Content-Type" => "multipart/form-data")
            schema = content["multipart/form-data"]["schema"]
            properties = schema["properties"]
            prop_keys = properties |> keys |> collect
            prop_values = properties |> values |> collect .|> x -> 
            if haskey(x, "format")
                return HTTP.Multipart{IOStream}
            elseif haskey(x, "type")
                x["type"] |> type_to_julia
            end

            prop_defaults = properties |> values |> collect .|> x -> try
                                x["default"]
                            catch
                            end
            prop_initialize = prop_defaults .|> isnothing
            names_types =
                zip(prop_keys, prop_values, prop_initialize, prop_defaults) |>
                collect .|>
                x -> string(
                    uppercasefirst(x[1]),
                    "::",
                    NT(x[2]),
                    begin
                        x[3] ? " = nothing" :
                        " = $(typeof(x[4]) == String ? string("\"",x[4],"\"") : x[4])"
                    end,
                    "\n",
                )
            struct_expr = """
                          @kwdef struct $(string(name, "_params"))
                          $( names_types |> join)
                          i::String = ""
                          end
                          """
        end
    else
        header = Dict("Content-Type" => "application/json")
        struct_expr = """
                      @kwdef struct $(string(name, "_params"))
                      i::String = ""
                      end
                      """
    end

    credentials_required = occursin("**Credential required**: *Yes*", description)

    # function_expr
    if header == Dict("Content-Type" => "application/json")
        function_expr = """
        #=                     
        $(description)
        =#
        function $(name)(params::$(string(name, "_params")))
            if params.i == "" && $(credentials_required)
                error("$(endpoint): This function require credential")
            end
            header = $(header)
            url = "https://$(server)/api$(endpoint)"
            params = Dict(lowercasefirst(string(key)) => getfield(params, key) for key in propertynames(params)) |> x -> filter(t -> t.second != nothing,x) |> JSON.json
            request = HTTP.post(url, header, params)
            request.body |> String |> JSON.parse
        end
        """
    elseif header == Dict("Content-Type" => "multipart/form-data")
        function_expr = """
        #=                     
        $(description)
        =#
        function $(name)(params::$(string(name, "_params")))
            if params.i == "" && $(credentials_required)
                error("$(endpoint): This function require credential")
            end
            
            url = "https://$(server)/api$(endpoint)"
            params = Dict(lowercasefirst(string(key)) => getfield(params, key) for key in propertynames(params)) |> 
            x -> filter(t -> t.second != nothing,x) 

            for (key, value) in params
                if typeof(value) == Bool
                    params[key] = string(value)
                end
            end

            body = HTTP.Form(params)

            request = HTTP.post(url, [], body)
            request.body |> String |> JSON.parse
        end
        """
    end

    # writeout_path
    endpoint_dir = endpoint |> st -> split(st, "/")[1:end-1]
    for i in eachindex(endpoint_dir)
        if startswith(endpoint_dir[i], r"\d")
            endpoint_dir[i] = "_" * endpoint_dir[i]
        end
    end
    endpoint_dir = endpoint_dir |> st -> joinpath(src_dir, st...)
    open(joinpath(endpoint_dir, string(name, ".jl")), "w") do io
        println(io, "# THIS FILE IS GENERATED BY MACRO")
        println(io, struct_expr)
        println(io, function_expr)
    end
end



NT(T) = Union{Nothing,T}

function type_to_julia(type)
    if type == "string"
        return String
    elseif type == "integer"
        return Int
    elseif type == "number"
        return Number
    elseif type == "boolean"
        return Bool
    elseif type == "any"
        return Any
    elseif type == "array"
        return Array
    elseif type == "object"
        return Dict
    elseif typeof(type) == Vector{Any}
        return NT(type[1] |> type_to_julia)
    else
        return Any
    end
end