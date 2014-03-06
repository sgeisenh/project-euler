smallestMul :: [Int] -> Int
smallestMul (n:[]) = n
smallestMul (n:t) = n * smallestMul tn
  where tn = map (\k -> if k `mod` n == 0 then k `div` n else k) t

main :: IO ()
main = print $ smallestMul [1..20]
