import System.IO
import Control.Monad
import Data.List
import System.Directory

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

-- main = forever $ do
--     line <- getLine
--     appendFile "todo.txt" (line ++ "\n")

main = do
    contents <- readFile "todo.txt"
    let todoTasks = lines contents
        numberedTasks = zipWith(\n line -> show n ++ " - " ++ line) [0..] todoTasks
    -- mapM_ putStrLn todoTasks
    mapM_ putStrLn(numberedTasks)
    putStrLn("Wich one do you want to delete?")
    numberString <- getLine
    let number = read numberString
        newTodoItems = unlines $ delete (todoTasks !! number) todoTasks
    (tempName, tempHandle) <- openTempFile "." "temp"
    hPutStr tempHandle newTodoItems
    hClose tempHandle
    removeFile "todo.txt"
    renameFile tempName "todo.txt" 