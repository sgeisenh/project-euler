fun isFactor p n = (n mod p = IntInf.toLarge(0))

fun largestPrimeFactor b =
  let
    fun lpf i n =
      if i = n then i
      else if isFactor i n then lpf (i + 1) (n div i)
      else lpf (i + 1) n
  in
    lpf (IntInf.toLarge(2)) b
  end

val b = valOf(IntInf.fromString("600851475143"))
val () = print(IntInf.toString(largestPrimeFactor b) ^ "\n")
