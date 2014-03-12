val instream = TextIO.openIn "problem8.txt"

fun loop ins =
  case TextIO.inputLine ins
    of SOME line => line ^ loop ins
     | NONE => ""

val input = loop instream
val slist = List.map (String.str) (String.explode input)
val tlist = String.concatWith " " slist
val toks = String.tokens (fn c => c = #" " orelse c = #"\n") tlist
val ilist = List.map (valOf o Int.fromString) toks

val maxprod =
  let
    fun n i = List.nth(ilist, i)
    fun prod i =
      n i*n(i+1)*n(i+2)*n(i+3)*n(i+4)
    val prods = List.tabulate(length ilist - 5, prod)
  in
    foldl Int.max 0 prods
  end

val () = print (Int.toString maxprod ^ "\n")
