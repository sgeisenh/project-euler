maxFactor :: Int -> Int
maxFactor n = mf n 2
  where
    mf n' a
      | n' == a = n'
      | n' `mod` a == 0 = mf (n' `div` a) (a)
      | otherwise = mf n' (a + 1)

main :: IO ()
main = print $ maxFactor 600851475143
