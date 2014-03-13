val instream = TextIO.openIn("problem13.txt")

fun loop ins =
  case TextIO.inputLine ins
    of NONE => ""
     | SOME line => line ^ loop ins

val input = loop instream
val nums = map (valOf o IntInf.fromString) 
            (String.tokens (fn c => c = #"\n") input)

val res = foldl (op+) (valOf (IntInf.fromString "0")) nums
val resstring = IntInf.toString res
val head = String.substring(resstring, 0, 10)
          

val () = print(head ^ "\n")
