fun sumsquares 0 acc = acc
  | sumsquares n acc = sumsquares (n-1) (n*n+acc)

fun squaresum 0 acc = acc*acc
  | squaresum n acc = squaresum (n-1) (n+acc)

val res = squaresum 100 0 - sumsquares 100 0
val () = print(Int.toString(res) ^ "\n")
