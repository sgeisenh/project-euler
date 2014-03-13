val instream = TextIO.openIn("problem22.txt")

fun loop ins =
  case TextIO.inputLine ins
    of NONE => ""
     | SOME line => line ^ loop ins

val input = loop instream

val namelist =
  String.tokens (fn c => c = #"\"" orelse c = #"," orelse c = #"\n") input

fun sort xs = let
  fun qs [] = []
    | qs [x] = [x]
    | qs (p::xs) = let
      val (less, more) = List.partition (fn x => String.<(x,p)) xs
      in
        qs less @ p :: qs more
      end
  in
    qs xs
  end

val sortednames = sort namelist
val enumnames = List.tabulate(length sortednames,
                  fn i => (i+1, List.nth(sortednames,i)))

fun stringscore s = let
    val clist = String.explode s
    val llist = map (Char.toLower) clist
    val ilist = map (Char.ord) llist
    val slist = map (fn x => x - 96) ilist
  in
    foldl (op +) 0 slist
  end

val scored = map (fn (i, s) => i * stringscore s) enumnames
val res = foldl (op +) 0 scored

val () = print(Int.toString res^"\n")
