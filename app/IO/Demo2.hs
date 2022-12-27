import Data.Char

-- main = do
--     contents <- getContents
--     putStr(map toUpper contents)


-- main = do
--     contents <- getContents
--     putStr(shortLinesOnly contents)

-- or

-- main = interact shortLinesOnly

-- shortLinesOnly :: String -> String
-- shortLinesOnly = unlines . filter(\x -> length x < 10) . lines


main = interact respondPalindromes

respondPalindromes :: String -> String
respondPalindromes = unlines . map(\xs -> if isPal xs then "pali" else "not pali") . lines

isPal :: String -> Bool
isPal xs = xs == reverse xs

