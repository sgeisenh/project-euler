fun numLetters x =
  if x < 20 then
    case x
      of 0 => 4
       | 1 => 3
       | 2 => 3
       | 3 => 5
       | 4 => 4
       | 5 => 4
       | 6 => 3
       | 7 => 5
       | 8 => 5
       | 9 => 4
       | 10 => 3
       | 11 => 6
       | 12 => 6
       | 13 => 8
       | 14 => 8
       | 15 => 7
       | 16 => 7
       | 17 => 9
       | 18 => 8
       | 19 => 8
  else if x < 100 then
    let
      val ones = if x mod 10 = 0 then 0 else numLetters (x mod 10)
    in
      case x div 10
        of 2 => 6 + ones
         | 3 => 6 + ones
         | 4 => 5 + ones
         | 5 => 5 + ones
         | 6 => 5 + ones
         | 7 => 7 + ones
         | 8 => 6 + ones
         | 9 => 6 + ones
    end
  else if x < 1000 then
    let
      val tens = if x mod 100 = 0 then 0 else 3 + numLetters (x mod 100)
      val hundreds = 7 + numLetters (x div 100)
    in
      tens + hundreds
    end
  else
    11

fun loop 0 = 0
  | loop n = numLetters n + loop (n - 1)

val () = print(Int.toString(loop 1000)^"\n")
      
