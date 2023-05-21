    module Messages
    using JSON, HTTP
    # include child functions in this directory
let
    src_dir = @__DIR__
    functions =
        readdir(src_dir) |>
        filter(x -> endswith(x, ".jl")) |>
        filter(x -> islowercase(x[1]))
    functions .|> include

    # include child modules in child directories

    modules =
    readdir(src_dir) |> filter(x -> isdir(joinpath(src_dir, x))) .|> uppercasefirst
    modules .|> x -> include(joinpath(src_dir, lowercase(x), replace(x,"-" => "_") * ".jl"))

end    end
    