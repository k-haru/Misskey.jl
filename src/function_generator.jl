# Make sure pwd is in misskey-hub/src/docs/api
using json5peg, HTTP
for (root, dirs, files) in walkdir(".")
    files = files |> x -> filter(x -> endswith(x, ".json5"), x)
    println("Directories in $root")
    println("Files in $root")
    for file in files
        filename = joinpath(root, file)
        println(joinpath(root, file)) 
    end
end

function generate_function(root,filename)
    json5_data = read(filename) |> String |> json5_parse

    expr = "$(Symbol(TODO))(TODO) = TODO" |> Meta.parse

    #write document
    write(TODO,expr |> Base.remove_linenums! |> string)
end
