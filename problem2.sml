fun sumFibs n1 n2 acc =
  let
    val n = n1 + n2
  in
    if n > 4000000 then acc
    else if n mod 2 = 0 then sumFibs n n1 (acc + n)
    else sumFibs n n1 acc
  end

val () = print(Int.toString(sumFibs 2 1 2) ^ "\n")
