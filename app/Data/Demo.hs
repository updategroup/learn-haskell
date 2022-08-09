module Data.Demo where
import Data.Map (Map)
import qualified Data.Map as Map

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
} deriving (Eq, Show, Read)

data Day = Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday deriving (Eq, Ord, Show, Read, Bounded, Enum)

data List t = Nil | t:. List t deriving (Eq, Ord)

-- data Either a b = Left a | Right b deriving (Eq, Ord, Read, Show)

data LockerState = Taken | Free deriving (Show, Eq)
type Code = String
type LockerMap = Map.Map Int (LockerState, Code)

lockerLookup :: Int -> LockerMap -> Either String Code
lockerLookup lockerNumber map =
    case Map.lookup lockerNumber map of
        Nothing -> Left $ "Locker number " ++ show lockerNumber ++ " doesn't exist!"
        Just (state, code) -> if state /= Taken
                                    then Right code 
                                    else Left $ "Locker " ++ show lockerNumber ++ " is already taken!"

lockers :: LockerMap
lockers = Map.fromList [
    (100, (Taken, "XD123")),
    (102, (Free, "AVX"))]      

data BookInfor = Book Int String [String]
                 deriving (Show)
                 