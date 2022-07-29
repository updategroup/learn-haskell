module Data.Demo where

data Point = Point Float Float deriving (Show)
data Shape = Circle Point Float Float | Rectangle Point Point deriving (Show)
surface :: Shape -> Float
surface (Circle _ _ r) = pi * r ^2 

-- data Person = Person String String Int deriving (Show)
-- firtName :: Person -> String
-- firtName (Person firtName _ _ ) = firtName

-- data Person = Person {
--     firtName:: String,
--     lastName:: String,
--     age:: Int
-- } deriving (Show)

-- data Car = Car String String Int deriving (Show)
-- data Car = Car {
--     company :: String,
--     model :: String,
--     year :: Int
-- } deriving (Show)

-- Type params
-- data Car a b c = Car{
--     company :: a,
--     model :: b,
--     year ::c
-- } deriving (Show)

-- tellCar :: Car -> String
-- tellCar (Car {company=a, model=b, year=c}) = "This is " ++ a ++ "is " ++ b ++ "year: " ++ show c

data Person = Person {
    firtName :: String,
    lastName :: String,
    age :: Int
} deriving Eq

data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday deriving (Eq, Ord, Show, Read, Bounded, Enum)
