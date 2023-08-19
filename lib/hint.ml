let is_alpha_lowercase (c : char) : bool =
  Char.code 'a' <= Char.code c && Char.code c <= Char.code 'z'
;;

module Hint = struct
  type t =
    | Unknown
    | NotHere of char
    | Here of char
  ;;

  let hints_from_string (string : string) : t list =
    let list = String.to_seq string
               |> List.of_seq
    in
    let rec aux acc list = match list with
      | c :: xs when is_alpha_lowercase c -> aux ((Here c) :: acc) xs
      | '!' :: c :: xs when is_alpha_lowercase c -> aux ((NotHere c) :: acc) xs
      | '_' :: xs -> aux (Unknown :: acc) xs
      | [] -> acc
      | _ -> failwith "Unexpected token"
    in
    aux [] list
    |> List.rev
  ;;

  let matches_hints (pattern : string) (string : string) : bool=
    let hintlist = hints_from_string pattern in
    if List.length hintlist = String.length string
    then
      let charlist = String.to_seq string |> List.of_seq in
      let here_predicate = List.for_all2 (fun c h ->
          match h with
          | Here h -> h = c
          | NotHere h -> h <> c
          | _ -> true
        ) charlist hintlist
      in
      if here_predicate
      then
        let not_here_hints = List.filter_map (fun h ->
            match h with
            | NotHere h -> Some h
            | _ -> None
          ) hintlist in
        List.for_all (fun c -> List.exists ((=) c) charlist) not_here_hints
      else false
    else false
  ;;

  let find_with_pattern (pattern : string) (list : string list) : (string list) =
    List.filter (matches_hints pattern) list
  ;;
end
