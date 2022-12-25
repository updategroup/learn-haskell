-- main = do
--     foo <- putStrLn("go1---")
--     putStrLn("go")
--     name <- getLine
--     putStrLn(name)

import Data.Char

-- main = do
--     putStrLn("What's your firt name?")
--     firtName <- getLine
--     putStrLn("What's your last name?")
--     lastName <- getLine
--     let bigFirtName = map toUpper firtName
--         bigLastName = map toUpper lastName
--     putStrLn("Hello " ++ bigFirtName ++ " " ++ bigLastName) 



-- let firstName = getLine

-- main = do
--     line <- getLine
--     if null line
--         then return ()
--         else do
--             putStrLn(reverseWords line)
--             main

-- reverseWords :: String -> String
-- reverseWords xs = unwords (map reverse (words xs))


-- main = do 
--     return ()
--     return "HI"
--     line <- getLine
--     return "Hi 1---"
--     return 4
--     putStrLn(line)

-- main = do
--     a <- return "Hie"
--     b <- return "hi 2"
--     putStrLn(a ++ " " ++ b)

-- hàm trên chẳng có ý nghĩa gì nên dùng let để thay thế

-- main = do
--     let a = "Hie"
--         b = "hi 2"
--     putStrLn(a ++ " " ++ b)