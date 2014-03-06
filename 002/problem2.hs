main :: IO ()
main = print $ sum $ filter even $ takeWhile (<4000000) fibs
  where fibs = 1 : 2 : zipWith (+) fibs (tail fibs)
