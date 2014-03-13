val sunFirst =
  let
    fun isMember (ms : int List.list) (m : int) =
      List.exists (fn e => e = m) ms
    val m31 = [1,3,5,7,8,10,12]
    val m30 = [4,6,9,11]
    fun count (wd, day, mon, yr) acc =
      let
        val turn = 
          if isMember m31 mon then 31
          else if isMember m30 mon then 30
          else if yr mod 4 = 0 andalso yr mod 100 <> 0 then 29
          else 28
      in
        if yr > 2000 then acc
        else if day = 1 andalso wd = 1 then count (2,2,mon,yr) (acc+1)
        else if day = turn then
          if mon = 12 then count ((wd mod 7)+1, 1, 1, yr+1) acc
          else count ((wd mod 7)+1, 1, mon+1, yr) acc
        else count ((wd mod 7)+1, day+1, mon, yr) acc
      end
  in
    count (3,1,1,1901) 0
  end

val () = print(Int.toString sunFirst ^ "\n")
