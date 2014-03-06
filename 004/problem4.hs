isPal :: Int -> Bool
isPal n = forw == back
  where
    forw = show n
    back = reverse forw

palProds :: [Int]
palProds = [x | x <- [a * b | a <- [100..999], b <- [100..999]], isPal x]

main :: IO ()
main = print $ maximum palProds
