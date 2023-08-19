# Wordlehelper
Utility program to get strings that matches a given wordle style pattern

`dict.txt` taken from [scholtes' gist](https://gist.github.com/scholtes/94f3c0303ba6a7768b47583aff36654d)

## Usage

```
$ dune build
$ _build/defaults/main.exe -e <pattern> <dictionary>
```

### Pattern format

|Pattern|Description|Worldle equivalent|
|---|---|---|
| char  | Denotes that this char is present at the exact position where it lies in the pattern | Green square        |
| ?char | The char is in the word but not in this position                                     | Yellow square       |
| _     | Unknown character                                                                    | Empty (Gray) square |

## Example
```
λ _build/default/bin/main.exe -e "w?a?h__" dict.txt
wrath
wheat
wharf
whale
whack
```

