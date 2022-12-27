import Data.Char

-- main = do
--     contents <- getContents
--     putStr(map toUpper contents)


main = do
    contents <- getContents
    putStr(shortLinesOnly contents)


shortLinesOnly :: String -> String
shortLinesOnly = unlines . filter(\x -> length x < 10) . lines    