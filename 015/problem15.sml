fun fact 0 : IntInf.int = 1
  | fact n = n * fact (n - 1)

fun lattice n : IntInf.int =
  fact (2 * n) div ((fact n)*(fact n))

val () = print(IntInf.toString(lattice(20)) ^ "\n")
