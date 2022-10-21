(lang dune 3.5)

(name pl_template)

(generate_opam_files true)

(source
 (github shinghinho/pl_template))

(authors "Shing Hin Ho")

(maintainers "Shing Hin Ho")

(license MIT)

; (documentation https://url/to/documentation)

(package
 (name pl_template)
 (synopsis "synopsis")
 (description "description")
 (depends ocaml dune))

(using menhir 2.1)

; See the complete stanza docs at https://dune.readthedocs.io/en/stable/dune-files.html#dune-project
