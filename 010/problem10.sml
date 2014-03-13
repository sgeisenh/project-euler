fun primesBelow n =
  let
    fun gen (i : int) : IntInf.int = Int.toLarge(2 * i + 3)
    val candidates = IntInf.toLarge(2)::List.tabulate(n div 2 - 1, gen)
    fun help [] acc = acc
      | help (e::es) acc =
        (print("Prime: " ^ IntInf.toString e ^ ", Length: "^
        Int.toString(List.length es)^"\n");
        help (List.filter (fn a => a mod e <> IntInf.toLarge(0)) es) (e + acc))
  in
    help candidates (Int.toLarge(0))
  end

val () = print(IntInf.toString (primesBelow 2000000) ^ "\n")
