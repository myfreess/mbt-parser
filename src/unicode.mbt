///|
let blocks : Array[Int] = [
  0x30,    0x39,    // 0-9
  0x41,    0x5a,    // A-Z
  0x5f,    0x5f,    // underscore
  0x61,    0x7a,    // a-z
  0xa1,    0xac,    // ¡-¬
  0xae,    0x2af,   // ®-ʯ
  0x1100,  0x11ff,  // Hangul Jamo
  0x1e00,  0x1eff,  // Latin additional
  0x2070,  0x209f,  // Superscripts and subscripts
  0x2150,  0x218f,  // Number forms
  0x2e80,  0x2eff,  // CJK Radical Supplement
  0x2ff0,  0x2fff,  // Ideographic Description Characters
  0x3001,  0x30ff,  // CJK Symbols and Punctuation. Excluding space..Hiragana & Katakana
  0x31c0,  0x9fff,  // CJK Unified Ideographs CJK Strokes..Katakana Phonetic Extensions..Enclosed CJK Letters and Months..CJK Compatibility..Extension A..Yijing Hexagram Symbols..CJK Unified Ideographs
  0xac00,  0xd7ff,  // Hangul Syllables..Hangul Jamo Exteneded-B
  0xf900,  0xfaff,  // CJK Compatibility Ideographs
  0xfe00,  0xfe0f,  // Variation Selectors
  0xfe30,  0xfe4f,  // CJK Compatibility Forms
  0x1f000, 0x1fbff, // Mahjong Tiles..Symbols for Legacy Computing
  0x20000, 0x2a6df, // CJK Unified Ideographs Extension B 
  0x2a700, 0x2ebef, // CJK Unified Ideographs Extension C..Extension D..Extension E..Extension F
  0x2f800, 0x2fa1f, // CJK Compatibility Ideographs Supplement
  0x30000, 0x323af, // CJK Unified Ideographs Extension G..Extension H
  0xe0100, 0xe01ef, // Variation Selectors Supplement
]

fn is_valid_unicode_codepoint(c : Int) -> Bool {
  ...
}
