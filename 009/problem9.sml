fun tripleProd (a, b, c) =
  if a*a + b*b = c*c then a * b * c
  else if a < b - 1 then tripleProd (a + 1, b, c - 1)
  else tripleProd (1, b + 1, 998 - b)

val () = print (Int.toString (tripleProd (1,1,998)) ^ "\n")
