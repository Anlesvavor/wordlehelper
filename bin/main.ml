open Wordlehelper

let filename = "dict.txt"
;;

let () = assert (Hint.matches_hints "w!a!h__" "whale");;
let () = assert (not @@ Hint.matches_hints "w!h!a__" "whale");;

Hint.find_with_pattern "whale" (Util.read_file filename)
|> List.iter (fun el -> print_string el; print_newline ();)
;;

Hint.find_with_pattern "_!u!o!r!g" (Util.read_file filename)
|> List.iter (fun el -> print_string el; print_newline ();)
;;
