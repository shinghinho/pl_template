open Mypl

let read_file path =
  let ch = open_in path in
  let s = really_input_string ch (in_channel_length ch) in
  close_in ch;
  s

let () =
  let open Sys in
  let n_args = Array.length argv in
  if n_args != 2 then
    (Printf.printf "Usage: %s <path>" argv.(0); 
     exit (-1))
  else
    let path = argv.(1) in
    let s = read_file path in
    Interpreter.interpret s
