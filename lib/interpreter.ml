open Lexing
open Syntax

type env = (name,int) Hashtbl.t

let new_env : env = Hashtbl.create 32

let rec eval_value (sigma : env) =
  function
  | Var x -> 
    (match Hashtbl.find_opt sigma x with
     | Some v -> v
     | None -> print_endline ("Runtime error: Unknown variable " ^ x); exit (-1))
  | Num i -> i
  | Add (x,y) -> eval_binop sigma (fun x y -> x+y) x y
  | Sub (x,y) -> eval_binop sigma (fun x y -> x-y) x y 
  | Mul (x,y) -> eval_binop sigma (fun x y -> x*y) x y 
  | Div (x,y) -> eval_binop sigma (fun x y -> x/y) x y
and eval_binop sigma f x y = f (eval_value sigma x) (eval_value sigma y)

let rec eval (sigma : env) = 
  function
  | Seq (p,q) -> eval sigma p; eval sigma q
  | Asg (x,e) -> let v = eval_value sigma e in Hashtbl.add sigma x v
  | Print e -> print_endline (string_of_int (eval_value sigma e))

let interpret s = eval new_env (Parser.program Lexer.read (from_string s))
