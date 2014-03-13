val instream = TextIO.openIn "problem11.txt"

fun loop ins =
  case TextIO.inputLine ins
    of NONE => []
     | SOME line =>
         (map (valOf o Int.fromString)
          (String.tokens (fn c => c = #" " orelse c = #"\n") line))::
          (loop ins)

val input = loop instream
val A = Array.fromList (map (Array.fromList) input)
val sub = Array.sub

val maxprod =
  let
    fun horprods (x, y) =
      if y > 19 then []
      else let
        val suba = sub(A, y)
      in
        if x <= 16 then 
          (sub(suba,x)*sub(suba,x+1)*sub(suba,x+2)*sub(suba,x+3))::
          horprods(x+1,y)
        else horprods(0,y+1)
      end
    fun vertprods (x, y) =
      if y > 16 then []
      else
        if x <= 19 then
          (sub(sub(A,y),x)*sub(sub(A,y+1),x)*
          sub(sub(A,y+2),x)*sub(sub(A,y+3),x))::vertprods(x+1,y)
        else vertprods(0,y+1)
    fun diarprods (x, y) =
      if y > 16 then []
      else
        if x <= 16 then
          (sub(sub(A,y),x)*sub(sub(A,y+1),x+1)*
          sub(sub(A,y+2),x+2)*sub(sub(A,y+3),x+3))::diarprods(x+1,y)
        else diarprods(0,y+1)
    fun dialprods (x, y) =
      if y > 16 then []
      else
        if x <= 16 then
          (sub(sub(A,y+3),x)*sub(sub(A,y+2),x+1)*
          sub(sub(A,y+1),x+2)*sub(sub(A,y),x+3))::dialprods(x+1,y)
        else dialprods(0,y+1)
    val b = (0,0)
  in
    foldl (Int.max) 0
    (map (foldl (Int.max) 0)
    [horprods b, vertprods b, diarprods b, dialprods b])
  end

val () = print(Int.toString(maxprod)^"\n")


