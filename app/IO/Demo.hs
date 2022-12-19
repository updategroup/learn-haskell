import System.IO   

main = do   
    todoItem <- getLine
    appendFile "girlfriend.txt" (todoItem ++ "\n")