fun countDig (0 : IntInf.int) : int = 0
  | countDig n = 1 + countDig (n div 10)

val sub = Array.sub

fun fib i = let
  val fibs : IntInf.int Array.array = Array.fromList[0,1,1]
  fun loop j = let
    val new = sub(fibs, (j+1) mod 3) + sub(fibs,(j+2) mod 3)
  in
    if countDig new >= i then j
    else
      (Array.update(fibs,j mod 3, new);
      loop (j+1))
  end
in
  loop 3
end

val () = print(Int.toString(fib 1000)^"\n")
