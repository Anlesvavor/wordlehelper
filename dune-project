(lang dune 3.10)

(name wordlehelper)

(generate_opam_files true)

(source
 (github anlesvavor/wordlehelper))

(authors "Jesús Sáenz")

(maintainers "Jesús Sáenz")

(license LICENSE)

(package
 (name wordlehelper)
 (synopsis "Aid for guessing words")
 (description "Utility program that filters out words from a dictionary given a pattern that is familiar to wordle players")
 (depends ocaml dune)
 (tags
  (topics text processing)))

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
