{
open Parser
open Lexing

exception SyntaxError of string

}

let int = '-'? ['0'-'9'] ['0'-'9']*
let sep = [' ' '\t' '\n']+
let name = ['a'-'z' '_']+

rule read =
  parse
  | sep        { read lexbuf }
  | int        { INT (int_of_string (lexeme lexbuf)) }
  | "print"    { PRINT }
  | ":="       { ASSIGN }
  | ';'        { COLON }
  | name       { NAME (lexeme lexbuf) }
  | eof        { EOF }
  | '+'        { ADD }
  | '-'        { SUB }
  | '*'        { MUL }
  | '/'        { DIV }
  | '('        { LP }
  | ')'        { RP }
