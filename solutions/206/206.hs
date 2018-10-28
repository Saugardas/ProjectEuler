-- 1389019170
import Data.List (find)

min_root = ceiling(sqrt(1020304050607080900) / 10) * 10
max_root = floor(sqrt(1929394959697989990) / 10) * 10

takeOdd :: String -> String
takeOdd [] = []
takeOdd (x:y:z) = x : takeOdd z
takeOdd (x:y) = [x]

isConcealedSquare :: Integer -> Bool
isConcealedSquare = (== "1234567890") . takeOdd . show . (^2)

main :: IO ()
main = do
    print $ find isConcealedSquare [x | x <- [min_root, min_root + 10 .. max_root]]
