fun palprod n1 n2 =
  if n2 = 900 then palprod (n1 - 1) (n1 - 1)
  else
    let
      val p = n1 * n2
      val prod = Int.toString p
      val prodtok = String.explode prod
      val prodtokrev = List.rev prodtok
      val prodrev = String.implode prodtokrev
    in
      case String.compare(prod, prodrev)
        of EQUAL => p
         | _     => palprod n1 (n2-1)
    end

val () = print(Int.toString(palprod 999 999) ^ "\n")
