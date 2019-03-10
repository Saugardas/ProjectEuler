-- 6857

import Data.List
import Data.Maybe

primeFactors :: Int -> [Int]
primeFactors num
    | num < 2 = []
    | otherwise = prime : primeFactors(num `div` prime)
        where prime = fromJust $ find (\x -> num `mod` x == 0) [2..num]


main :: IO ()
main = print . last . primeFactors $ 600851475143
