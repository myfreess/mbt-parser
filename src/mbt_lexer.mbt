
///|
struct Lexbuf {
   content : String
   mut pos : Int
 }

///|
pub fn Lexbuf::from_string(content : String) -> Lexbuf {
   { content, pos: 0 }
 }

// NOTE: MoonBit do have unboxed Option[Char] optimization
///|
fn next(self : Lexbuf) -> Char? {
   if self.pos < self.content.length() {
     let ch = self.content[self.pos]
     self.pos += 1
     Some(ch)
   } else {
     None
   }
 }

///|
fn substring(self : Lexbuf, start : Int, end : Int) -> String {
   self.content.substring(start~, end~)
 }

///|
typealias LexTagAction = Array[Array[Int]]

///|
typealias LexState = Int

///|
typealias LexInput = Int

///|
pub(all) struct LexEngine {
   graph : Array[(LexState) -> (LexState, LexTagAction)]
   end_nodes : Array[(Int, Array[((Int, Int), (Int, Int))])?]
   start_tags : Array[Int]
   code_blocks_n : Int
 }

///|
pub fn run(self : LexEngine, lexbuf : Lexbuf) -> (Int, Array[(Int, Int)]) {
   let mut state = 1
   let mut tagState : Array[Array[Int]] = []
   let backtrace = Array::make(self.code_blocks_n, None)
   for tag in self.start_tags {
     while tagState.length() <= tag {
       tagState.push([])
     }
     tagState[tag].push(lexbuf.pos)
   }
   while state != 0 {
     match self.end_nodes[state] {
       Some(t) => backtrace[t.0] = Some((lexbuf.pos, state, tagState))
       _ => ()
     }
     let b = match lexbuf.next() {
       Some(b) => b
       None => '\x00'
     }
     let next = self.graph[state](b.to_int())
     state = next.0
     let new_tagState : Array[Array[Int]] = []
     for i = 0; i < next.1.length(); i = i + 1 {
       new_tagState.push([])
       for j = 0; j < next.1[i].length(); j = j + 1 {
         let t = next.1[i][j]
         if t == -1 {
           new_tagState[i].push(lexbuf.pos)
         } else {
           new_tagState[i].push(tagState[i][t])
         }
       }
     }
     tagState = new_tagState
   }
   for index, b in backtrace {
     match b {
       Some((p, state, tagState)) => {
         lexbuf.pos = p
         let captures = self.end_nodes[state].unwrap().1.map(
           fn {
             ((b_t, b_r), (e_t, e_r)) => (tagState[b_t][b_r], tagState[e_t][e_r])
           },
         )
         break (index, captures)
       }
       None => ()
     }
   } else {
     (self.code_blocks_n, [])
   }
 }




let pos_fname : Ref[String] = Ref::new("empty")
let pos_lnum : Ref[Int] = Ref::new(1)
let pos_bol : Ref[Int] = Ref::new(0)

fn reset_lex(fname : String) -> Unit {
   pos_fname.val = fname
   pos_lnum.val = 1
   pos_bol.val = 0
 }

fn newline(pos : Int) -> Unit {
   pos_lnum.val += 1
   pos_bol.val = pos
 }

fn newpos(pos : Int) -> Position {
   { fname: pos_fname.val, lnum: pos_lnum.val, bol: pos_bol.val, cnum: pos }
 }



let token_tag_action_row_1 : Array[Int] = [-1]
let token_tag_action_row_0 : Array[Int] = [0]

let token_tag_action_0 : Array[Array[Int]] = [token_tag_action_row_0, token_tag_action_row_1]

fn token_state_0(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (0, [])
   }
 }
fn token_state_1(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     0 => (2, token_tag_action_0)
     _ => (0, [])
   }
 }
fn token_state_2(input : LexInput) -> (LexState, LexTagAction) {
   match input {
     _ => (0, [])
   }
 }

let __mbtlex_engine_token: LexEngine = { graph: [token_state_0, token_state_1, token_state_2, ], end_nodes: [None, None, Some((0, [((0, 0), (1, 0))]))], start_tags: [0], code_blocks_n: 1 }
fn token( lexbuf : Lexbuf ) ->  (Token, Position, Position)  {
 match __mbtlex_engine_token.run(lexbuf) {
 (0, __mbtlex_captures) => {
 let (_start_pos_of_t, _end_pos_of_t) = __mbtlex_captures[0]
 let t: String = lexbuf.substring(_start_pos_of_t, _end_pos_of_t)
 ignore(t)
  (EOF, newpos(_start_pos_of_t), newpos(_end_pos_of_t)) 
 }
 _ => abort("lex: fail to match")
 }
 }



