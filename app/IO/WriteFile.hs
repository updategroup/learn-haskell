import System.IO
import Control.Monad

-- main = do
--     handle <- openFile "girlfriend.txt" ReadMode
--     contents <- hGetContents handle
--     putStr(contents)
--     hClose handle

-- main = do
--     withFile "girlfriend.txt" ReadMode (\handle -> do
--         contents <- hGetContents handle
--         putStr contents)

-- or

-- main = do
--     contents <- readFile "girlfriend.txt"
--     putStr(contents)

-- main = do
--     -- contents <- readFile "g1.txt"
--     -- writeFile "g2.txt" contents
--     appendFile "g1.txt" "xxx nx \n xxxtx"

-- main = do
--     todoItem <- getLine
--     appendFile "todo.txt" (todoItem ++ "\n")

main = forever $ do
    line <- getLine
    appendFile "todo.txt" (line ++ "\n")