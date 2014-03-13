val instream = TextIO.openIn("problem18.txt")

fun loop ins =
  case TextIO.inputLine ins
    of NONE => []
     | SOME line =>
         (map (valOf o Int.fromString)
         (String.tokens (fn c => c = #" " orelse c = #"\n") line))::
         (loop ins)

val input = loop instream
fun get(l,n) = List.nth(List.nth(input, l), n)

fun maxSum l n acc =
  if l > length input - 1 then acc
  else
    let
      val left = maxSum (l+1) n (acc + get(l,n))
      val right = maxSum (l+1) (n+1) (acc + get(l,n))
    in
      Int.max(left, right)
    end

val () = print(Int.toString(maxSum 0 0 0) ^ "\n")
