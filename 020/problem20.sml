fun bigfac (n : IntInf.int) : IntInf.int =
  if n = 0 then 1 else n * bigfac(n-1)

fun digitSum (n : IntInf.int) : IntInf.int =
  if n = 0 then 0 else n mod 10 + digitSum(n div 10)

val () = print(IntInf.toString(digitSum(bigfac(100)))^"\n")
