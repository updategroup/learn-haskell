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

main = do
    line <- getLine
    if null line
        then return ()
        else do
            putStrLn(reverseWords line)
            main

reverseWords :: String -> String
reverseWords xs = unwords (map reverse (words xs))