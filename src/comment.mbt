struct Comment {
  content : String
  mut kind : Kind
  consumed_by_docstring : Ref[Bool]
}

enum Kind {
  Inline_trailing
  Ownline(leading_blank_line~ : Bool, trailing_blank_line~ : Bool)
}