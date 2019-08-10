-- 872187

import Numeric (showIntAtBase)
import Data.Char (intToDigit)

isPalindrome :: String -> Bool
isPalindrome str = str == reverse str

toBinary :: Int -> String
toBinary num = showIntAtBase 2 intToDigit num ""

main :: IO ()
main = print $ sum [x | x <- [1, 3..999999], isPalindrome(show x), isPalindrome(toBinary x)]
