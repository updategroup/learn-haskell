-- module Data.Demo2  
-- ( 
--     area,
--     nudge,
--     Shape(..),
--     Point(..)

-- ) where 
import qualified Data.Map as Map



-- data Bool = False | True
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
    age1 :: Int
    -- height :: Float,
    -- phoneNumber :: String,
    -- flavor :: String
} deriving (Show, Eq)

data Car = Car {
    company :: String,
    model :: String,
    year :: Int
} deriving (Show)

car = Car{company="Ford", model="Mustang", year=1990}

data Car1 a b c = Car1 {
    company1 :: a,
    model1 :: b,
    year1 :: c
} deriving (Show)

-- tellCar1 :: Car1 -> String
tellCar1 (Car1 {company1=c, model1=m, year1=y}) = "This" ++ c ++ " " ++ m ++ " " ++ show y

-- data Maybe a = Nothing | Just a
data IntMaybe = INothing | IJust Int deriving (Show)

mikeD = Person1 {firtName1="M", lastName1="D", age1=43}
adRock = Person1 {firtName1="A", lastName1="H", age1=41}
mca = Person1 {firtName1="A", lastName1="Y", age1=44}

data Day = Monday | Tuesday | Wdnesday | Thursday | Friday | Saturday | Sunday deriving(Show, Eq, Enum, Read, Bounded)

-- type String = [Char]

-- phoneBook :: [(String: String)]
-- phoneBook = [
--     ("betty", "555"),
--     ("bonnie", "452")
-- ]

-- type PhoneBook = [(String, String)]
-- phoneBook :: (PhoneBook a) => [a]

type PhoneNumber = String
type Name = String
type PhoneBook = [(Name, PhoneNumber)]

-- inPhoneBook :: Name -> PhoneNumber -> [(String, String)] -> Bool
-- inPhoneBook :: Name -> PhoneNumber -> PhoneBook -> Bool
-- inPhoneBook name pnumber pbook = (name, pnumber) `elem` pbook

-- data Either a b = Left a | right b deriving (Eq, Ord, Read, Show)

data LockerState = Taken | Free deriving(Show, Eq)
type Code = String
type LockerMap = Map.Map Int (LockerState, Code)

lockerLookup :: Int -> LockerMap -> Either String Code
lockerLookup lockerNumber xs = case Map.lookup lockerNumber xs of 
    Nothing -> Left $ "Locker " ++ show lockerNumber ++ " doesn't exist"
    Just (state, code) -> if state /= Taken then Right code else Left $ "Locker " ++ show lockerNumber ++ " is already taken"


lockers :: LockerMap
lockers = Map.fromList 
    [
        (100, (Taken, "1")),
        (101, (Free, "2")),
        (103, (Taken, "3")),
        (104, (Taken, "4"))
    ]


data List a = Empty | Cons a (List a) deriving(Show, Read, Eq, Ord)
-- data List1 a = Empty | Cons {listHead :: a, listTail :: List1 a} deriving(Show, Read, Eq, Ord)

-- class Eq a where
--     (==) :: a -> a -> Bool
--     (/=) :: a -> a -> Bool
--     x == y = not (x /= y)
--     x /= y = not (x == y)

data TraffictLight = Red | Yellow | Green

instance Eq TraffictLight where
    Red == Red = True
    Green == Green = True
    Yellow == Yellow = True
    _ == _ = False

instance Show TraffictLight where
    show Red = "Red light"
    show Yellow = "Yellow light"
    show Green = "Green light"   
    
-- instance (Eq m) => Eq (Maybe m) where
--     Just x == Just y = x == y
--     Nothing == Nothing = True
--     _ == _ = False    

class YesNo a where
    yesno :: a -> Bool

instance YesNo Int where
    yesno 0 = False
    yesno _ = True

instance YesNo [a] where
    yesno [] = False
    yesno _ = True
    
instance YesNo Bool where
    yesno = id    

instance YesNo (Maybe m) where
    yesno (Just _) = True
    yesno Nothing = False    

instance YesNo TraffictLight where
    yesno Red = False
    yesno _ = True    

yesnoIf :: (YesNo y) => y -> a -> a -> a
yesnoIf v r n = if yesno v then r else n    


class Funtor1 f where
    fmap1 :: (a -> b) -> f a -> f b

instance Funtor1 [] where
    fmap1 = map    

instance Funtor1 Maybe where
    fmap1 f (Just x) = Just (f x)
    fmap1 f Nothing = Nothing   
    
instance Funtor1 (Either a) where
    fmap1 f (Right x) = Right (f x)
    fmap1 f (Left x) = Left x