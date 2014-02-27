fun isFactor p n = (i mod p = 0)

fun primes n =
  let
    fun primes' [] = []
      | primes' p::l =
      p::(primes' (List.filter (not o (isFactor p) l)))
  in
    primes' (List.tabulate (fn i => i + 2) (n - 2))
  end

fun largestPrimeFactor b =
  let
    val pn = (int) Math.sqrt((real) b)
    val ps = List.rev(primes)
    fun lpf [] = ~1
      | lpf p::pl =
        if isFactor p b then p
        else lpf pl 
  in
    lpf ps
  end

val () = print(Int.toString(largestPrimeFactor 600851475143) ^ "\n")