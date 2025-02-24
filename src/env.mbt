struct LexEnv {
  docstrings : Array[(Loc, Comment)]
  comment : Bool
  name : String
  arr : Array[(Token, Position, Position)]
  mut current_line : Int
  mut current_bol : Int
  last_unhandled_comment : Ref[(Comment, Int)?]
  asi_context : ASIContext
  start_cnum : Int
  is_interpolation : Bool
}