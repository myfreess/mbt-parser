type! Lexical_error {
  Illegal_character(Int)
  Unterminated_string
  Unterminated_string_in_variable_interploation
  Unterminated_bytes
  Interp_invalid_multiline_string
  Interp_invalid_comment
  Interp_invalid_attribute
  Interp_missing_expression
  Invalid_escape_sequence(String)
  Non_ascii_in_bytes(String)
  Invalid_dot_int(String)
  Invalid_byte_literal(String)
}