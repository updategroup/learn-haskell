module Data.Demo where

data Point = Point Float Float deriving (Show)
data Shape = Circle Point Float Float | Rectangle Point Point deriving (Show)
surface :: Shape -> Float
surface (Circle _ _ r) = pi * r ^2 

-- data Person = Person String String Int deriving (Show)
-- firtName :: Person -> String
-- firtName (Person firtName _ _ ) = firtName

data Person = Person {
    firtName:: String,
    lastName:: String,
    age:: Int
} deriving (Show)

-- data Car = Car String String Int deriving (Show)
data Car = Car {
    company :: String,
    model :: String,
    year :: Int
} deriving (Show)
