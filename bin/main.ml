open Wordlehelper


let () =
  let usage_msg = "wordlehelper -e <pattern> <dictionary_file>" in
  let pattern = ref "" in
  let directory_file = ref "" in
  let anon_fun filename = directory_file := filename in
  let speclist =
    [("-e", Arg.Set_string pattern, "Wordle pattern")]
  in
  Arg.parse speclist anon_fun usage_msg;
  let string_list = Util.read_file !directory_file in
  Hint.find_with_pattern !pattern string_list
  |> List.iter (fun el -> print_string el; print_newline ();)
