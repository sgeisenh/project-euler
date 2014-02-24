fun sumMul 0 = 0
  | sumMul x =
  if x mod 3 = 0  orelse x mod 5 = 0 then
    x + sumMul (x - 1)
  else
    sumMul (x - 1)

val () = print(Int.toString(sumMul 999) ^ "\n")
  
