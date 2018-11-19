-- 4613732

fibs = map fst $ iterate (\(x, y) -> (y, x + y)) (0, 1)

sumEven :: [Int] -> Int
sumEven = foldr (\x sum -> if even x then x + sum else sum) 0

main :: IO ()
main = do
    print $ sumEven $ takeWhile (< 4000000) fibs
