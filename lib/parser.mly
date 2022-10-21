%{

open Syntax

%}

%token <int> INT
%token ADD
%token SUB
%token MUL
%token DIV
%token LP
%token RP

%token PRINT
%token COLON
%token ASSIGN
%token <Syntax.name> NAME
%token EOF

%right COLON
%nonassoc ASSIGN

%left ADD SUB
%left MUL DIV

%start <Syntax.prog> program
%%

program:
  | p = prog EOF { p }
  ;

prog:
  | x = NAME ASSIGN e = value { Asg (x,e) }
  | p = prog COLON q = prog   { Seq (p,q) }
  | PRINT e = value           { Print e }
  ;

value:
  | i = INT                 { Num i }
  | x = NAME                { Var x }
  | a = value ADD b = value { Add (a,b) }
  | a = value SUB b = value { Sub (a,b) }
  | a = value MUL b = value { Mul (a,b) }
  | a = value DIV b = value { Div (a,b) }
  | LP a = value RP         { a }
  ;
