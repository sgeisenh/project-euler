difference :: Int -> Int
difference n = (sum[1..n])^2 - sum [i^2 | i <- [1..n]]

main :: IO ()
main = print $ difference 100
