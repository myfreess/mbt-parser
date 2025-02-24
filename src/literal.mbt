struct Char_literal {
  val : UInt
  repr : String
}

struct String_literal {
  val : String
  repr : String
}

struct Byte_literal {
  val : Byte
  repr : String
}

struct Bytes_literal {
  val : Bytes
  repr : String
}

struct Interp_source {
  source : String
  loc : Loc
}

enum Interp_elem {
  Lit(c~:String, repr~:String, loc~:Unit)
  Source(Interp_source)
}

typealias Interp_literal = Array[Interp_elem]