enum Expr {
  Pexpr_apply(func~ : Expr, args~ : Array[Argument])
}

struct Argument {
  value : Expr
  kind : Argument_kind
}

enum Argument_kind {
  Positional
  Labelled(Label)
  Labelled_pun(Label)
  Labelled_option(label~ : Label, question_loc~ : RLoc)
  Labelled_option_pun(label~ : Label, question_loc~ : RLoc)
}

struct Label {
  name : String
  loc : RLoc
}