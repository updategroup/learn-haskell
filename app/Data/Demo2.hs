module Data.Demo2  
( 
    area,
    nudge,
    Shape(..),
    Point(..)

) where 
import Data.Map (Map)



data Bool = False | True
-- data Int = -214 | -214 | ...  -1 | 0 | 1 | 2 | ... | 214
data Shape = Circle Float Float Float | Rectangle Float Float Float Float deriving (Show)

area :: Shape -> Float
area (Circle _ _ r) = r * 3.14

toList = map (Circle 1 2) [3,4]

data Point = Point Float Float deriving (Show)
data Shape1 = Circle1 Point Float | Rectangle1 Point Point deriving (Show)

area1 :: Shape1 -> Float
area1 (Circle1 _ r) = 3.14
area1 (Rectangle1 (Point x1 y1) (Point x2 y2)) = (abs $ x2 - x1) * (abs $ y2 - y1)

nudge :: Shape1 -> Float -> Float -> Shape1
nudge (Circle1 (Point x y) r) a b = Circle1 (Point (x+a) (y+b)) r
nudge (Rectangle1 (Point x1 y1) (Point x2 y2)) a b = Rectangle1 (Point (x1 + a) (y1 + b)) (Point (x2 + a) (y2 + b))

baseCircle :: Float -> Shape1
baseCircle r = Circle1 (Point 0 0) r

baseRect :: Float -> Float -> Shape1
baseRect w h = Rectangle1 (Point 0 0 ) (Point w h)

data Person = Person String String Int Float String String deriving (Show)
person = Person "Quoc" "Tran" 26 170.3 "123.345" "Chocalte"

firtName :: Person -> String
firtName (Person firtName _ _ _ _ _) = firtName

lastName :: Person -> String
lastName (Person _ lastName _ _ _ _) = lastName

age :: Person -> Int
age (Person _ _ age _ _ _) = age

data Person1 = Person1 {
    firtName1 :: String,
    lastName1 :: String,
    age1 :: Int,
    height :: Float,
    phoneNumber :: String,
    flavor :: String
} deriving (Show)

data Car = Car {
    company :: String,
    model :: String,
    year :: Int
} deriving (Show)

car = Car{company="Ford", model="Mustang", year=1990}
