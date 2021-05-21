# npm-bin-search
Searches npm registry for input query arg ($1)
and returns global/binary-containing modules in
an organized (sorted) table of results.

## Usage:
```
npm-binary-search [query]
```

## Flags:

```
-h, --help	Show this help message
```

## Config:

Config file is generated at `$HOME/.config/npm-bin-search/out_props.config`.
To set properties you want to be printed in output, add them to the
w`output_props.config` file.

example:
 ```
 repository_url
 description
 [etc...]

 ```
