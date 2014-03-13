fun divsum n =
  let
    fun help i acc =
      if i = n then acc
      else if n mod i = 0 then help (i+1) (acc+i)
      else help (i+1) acc
  in
    help 1 0
  end

fun isamic n =
  let
    val sum = divsum n
    val sumsum = divsum sum
  in
    sumsum = n andalso sum <> n
  end

val sumbelow =
  let
    fun help i acc =
      if i = 10000 then acc
      else if isamic i then 
        (print(Int.toString i ^" is amicable!\n");
        help (i+1) (acc+i))
      else help (i+1) acc
  in
    help 2 0
  end

val () = print(Int.toString sumbelow^"\n")
