-- main = do
--     foo <- putStrLn("go1---")
--     putStrLn("go")
--     name <- getLine
--     putStrLn(name)

import Data.Char

main = do
    putStrLn("What's your firt name?")
    firtName <- getLine
    putStrLn("What's your last name?")
    lastName <- getLine
    let bigFirtName = map toUpper firtName
        bigLastName = map toUpper lastName
    putStrLn("Hello " ++ bigFirtName ++ " " ++ bigLastName)    