fun coln (i : IntInf.int) =
  let
    fun help (n : IntInf.int) acc =
      if n = 1 then (acc + 1)
      else if n mod 2 = 0 then help (n div 2) (acc + 1)
      else help (3 * n + 1) (acc + 1)
  in
    help i 0
  end

fun genBelow n =
  let
    fun help i j max =
      if i >= n then j
      else
        let
          val pre = coln i
        in
          if pre > max then help (i+1) i pre
          else help (i+1) j max
        end
  in
    help 1 (~1) 0 
  end

val () = print(IntInf.toString(genBelow 1000000) ^ "\n")
