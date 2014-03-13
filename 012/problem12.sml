fun triWithDivs n =
  let
    fun numDivs x i acc =
      let
        val lim = Math.sqrt((real) x)
      in
        if (real) i > lim then acc
        else if x mod i = 0 then numDivs x (i+1) (acc + 2)
        else numDivs x (i+1) acc
      end
    fun hasn m = numDivs m 1 0 > n
    fun loop j =
      let
        val tri = (j * (j+1)) div 2
      in
        if hasn tri then tri
        else loop (j+1)
      end
  in
    loop 1
  end

val () = print(Int.toString(triWithDivs 500)^"\n")
