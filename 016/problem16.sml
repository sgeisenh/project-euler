fun pow 0 : IntInf.int = 1
  | pow n = 2 * pow (n - 1)

fun addDigits (0 : IntInf.int) : IntInf.int = 0
  | addDigits x = x mod 10 + addDigits (x div 10)

val () = print (IntInf.toString(addDigits(pow 1000)) ^ "\n")
