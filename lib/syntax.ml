type name = string

type value =
  | Var of name
  | Num of int
  | Add of value * value
  | Sub of value * value
  | Mul of value * value
  | Div of value * value

type prog =
  | Asg of name * value
  | Seq of prog * prog
  | Print of value
