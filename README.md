# Misskey.jl

A Julia wrapper for interacting with the Misskey API.
These functions and modules are generated based on misskey-hub/src/docs/api by macro/* .
Currentry, some APIs are not available (e.g. admin\driveshow-file.json5, drive\filesshow.json5, notificationsread.json5, usersrelation.json5, usersshow.json5)
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
