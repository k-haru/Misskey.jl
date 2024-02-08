# Misskey.jl

A Julia wrapper for interacting with the Misskey API.

These functions and modules are generated based on misskey.io/api-doc (OpenAPI specification)

Streaming APIs are not implemented. (TODO)

# Usage

```julia
]
add https://github.com/k-haru/Misskey.jl
```

```julia
using Misskey
# note 
server = "misskey.io"
token = "QAWSEDRFTGYHUJIKOLP" # example
text = "Hello misskey!"
note_create_params = Misskey.Notes.create_params(Text=text,i = token)
Misskey.Notes.create(server,note_create_params)
```

```julia
using Misskey
# upload file
server = "misskey.io"
token = "QAWSEDRFTGYHUJIKOLP"
file = "README.md"
drive_create_params = Misskey.Drive.Files.create_params(File=file,i = token)
Misskey.Drive.Files.create(server,drive_create_params)
```
