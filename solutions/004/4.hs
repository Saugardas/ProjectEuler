-- 906609

isPalindrome :: String -> Bool
isPalindrome str = str == reverse str

main :: IO ()
main = do
    print . maximum $ [x * y | x <- [100..999], y <- [100..999], isPalindrome . show $ x * y]
