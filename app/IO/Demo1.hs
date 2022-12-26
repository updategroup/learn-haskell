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


-- when

-- import Control.Monad
-- main = do
--     input <- getLine
--     when (input == "OK") $ do
--         putStrLn(input)

-- <=>

-- main = do
--     input <- getLine
--     if input == "OK" 
--         then putStrLn(input)
--         else return ()


-- sequence

-- main = do
--     a <- getLine
--     b <- getLine
--     c <- getLine
--     print [a, b, c]

-- <=>

-- main = do
--     rs <- sequence [getLine, getLine, getLine]
--     print rs
--     let vs = map (++ "x") rs
--     print vs


-- forever

import Control.Monad
import Data.Char

main = forever $ do
    putStr("give me some input ")
    l <- getLine
    putStrLn(map toUpper l)

