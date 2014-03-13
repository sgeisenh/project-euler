val instream = TextIO.openIn("problem67.txt")

fun loop ins =
  case TextIO.inputLine ins
    of NONE => []
     | SOME line =>
         (map (valOf o Int.fromString)
         (String.tokens (fn c => c = #" " orelse c = #"\n") line))::
         (loop ins)

val input = loop instream
val A = Array.fromList (map (Array.fromList) input)
val sub = Array.sub
fun get(l,n) = sub(sub(A, l),n)

fun maxSum l n =
  if l < 0 then get(0,0)
  else if n > l then maxSum (l-1) 0
  else
    (Array.update(sub(A,l),n,
    get(l,n) + Int.max(get(l+1,n),get(l+1,n+1)));
    maxSum l (n+1))

val () = print(Int.toString(maxSum (Array.length A - 2) 0) ^ "\n")
