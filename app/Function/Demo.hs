module Function.Demo where

myDrop:: Int -> [a] -> [a]
myDrop n sx = if n <= 0 || null sx
              then sx
              else myDrop(n-1) (tail sx)

lucky :: (Integral a) => a -> String
lucky 7 = "THIS IS 7"
lucky x = "NOT 7"

factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial(n-1)

headD :: [a] -> a
headD [] = error "Cant call "
headD (x: _) = x

lengthD :: (Num a) => [a] -> a
lengthD [] = 0
lengthD (_: sx) = 1 + lengthD sx

sumD ::  (Num a) => [a] -> a
sumD [] = 0
sumD (x:sx) = x + sumD sx

-- as pattern
capital :: String -> String
capital "" = "Emty"
capital all@(x:sx) = "this is " ++ all ++ " is " ++ [x]

-- guard
bmiTell :: (RealFloat a) => a -> a -> String
bmiTell w h
        | w / h ^ 2 <= 18.5 = "Om"
        | otherwise = "Map"

maxD :: (Ord a) => a -> a -> a
maxD a b
        | a > b = a
        | otherwise = b

len3 amount balance
        | amount <=0 = Nothing
        | amount > reserve * 0.5 = Nothing
        | otherwise = Just newBalance
        where
        reserve = 100
        newBalance = balance - amount    

niceDrop n xs
        | n <= 0 = xs
niceDrop _ [] = []
niceDrop n (_:xs) = niceDrop(n-1) xs        

-- compareD :: (Ord a) => a -> a -> Ordering
-- a `compareD`wh b
--         | a > b = GT
--         | a == b = EQ
--         | otherwise = LT

-- where
bmiTellW :: (RealFloat a) => a -> a -> String
bmiTellW w h
        | result <= skinny = "Om"
        | result <= normal = "BT"
        | otherwise = "Map"
        where 
        result = w / h ^ 2
        skinny = 18.5
        normal = 25.0
        -- (skinny, normal) = (18.5, 25.0)

initials :: String -> String -> String
initials firt last = [f] ++ " " ++ [l]
        where
        (f:_) = firt
        (l:_) = last 

lend2 amount balance = if amount < reserve * 0.5
                       then Just newBalance
                       else Nothing
        where 
        reserve = 100
        newBalance = balance - amount  

pluralise :: String -> [Int] -> [String]
pluralise word counts = map plural counts
        where plural 0 = "no " ++ word ++ "s"
              plural 1 = "one " ++ word
              plural n = show n ++ " " ++ word ++ "s"

-- let in          
cylinder :: (RealFloat a) => a -> a -> a
cylinder r h =
        let sideArea = 2 * pi * r * h
        -- topArea = 8
        in sideArea + 2 * 3

foo = let a = 1
      in let b = 2
        in a+b

bar = let x = 1
      in ((let x ="foo" in x), x)  

quux = let a = "foo"
         in a ++ "eek"

lend amount balance = let reserve = 100
                          newBalance = balance - amount
                      in if balance < reserve
                         then Nothing
                         else Just newBalance      


-- case expression
headC :: [a] -> a
headC xs = case xs of [] -> error "No head empty"
                      (x:_) -> x

fromMaybe :: a -> (Maybe a) -> a
fromMaybe defval wrapped = 
        case wrapped of 
                Nothing -> defval
                Just value -> value    

data Fruit = Apple | Orange
-- apple = "apple"
-- orange = "orange"

wichFruit :: String -> Fruit
wichFruit f = case f of
                "apple" -> Apple
                "orange" -> Orange

describeList :: [a] -> String
describeList xs = "The List is " ++ case xs of 
                                        [] -> "Emty"
                                        [x] -> "a singeleton list"
                                        xs -> "a long list"                 

describeListWhere :: [a] -> String
describeListWhere xs = "The List is " ++ what xs
                where
                what [] = "emty"
                what [x] = "singleton list"
                what xs = "a long list"        


maxList :: (Ord a ) => [a] -> a
maxList [] = error "OKI-------------"
maxList [x] = x
maxList (x:xs) = max x (maxList xs)

-- replicateD:: (Integral a) => a -> [b] -> [b]
-- replicateD a b
--         | a <= 0 = []
--         | otherwise = [b] ++ replicateD(a-1) b

takeD :: (Integral a) => a -> [b] -> [b]  
takeD k _ 
    | k <=0 = []
takeD _ [] = []
takeD k (s:sx) = s : takeD(k-1) sx

reverseD :: [a] -> [a]
reverseD [] = []
reverseD (x:sx) = (reverseD sx) ++ [x]

zipD :: [a] -> [b] -> [(a,b)]
zipD _ [] = []
zipD [] _ = []
zipD (x:sx) (y:sy) = [(x,y)]++(zipD sx sy)

-- lambda
-- numLongChainsL :: Int
-- numLongChainsL = length (filter (\sx -> length xs > 15) (map chain [1..100]))

-- Foldl Foldr
sumL :: (Num a) => [a] -> a
sumL xs = foldl (\acc x -> acc + x) 0 xs
-- sumL = foldl (+) 0

elemL :: (Eq a) => a -> [a] -> Bool
elemL y ys = foldl (\acc x -> if x == y then True else acc) False ys

mapFR :: (a -> b) -> [a] -> [b] -- mapL (+3) [1,2,3]
mapFR f xs = foldr (\x acc -> f x : acc) [] xs

-- Cấu trúc dữ liệu đệ quy
-- data List a = Empty | Cons a (List a) deriving (Show, Read, Eq, Ord)

-- data List a = Empty | Cons {
--         listHead :: a,
--         listTail :: List a
-- } deriving (Show, Read, Eq, Ord)

infixr 5 :-:
data List a = Empty | a :-: (List a) deriving (Show, Read, Eq, Ord)

-- infixr 5 ++
-- (++) :: [a] -> [a] -> [a]
-- [] ++ ys = ys
-- (x:xs) ++ ys = x : (xs ++ ys)

infixr 5 .++
(.++) :: List a -> List a -> List a
Empty .++ ys = ys
(x :-: xs) .++ ys= x :-: (xs .++ ys)

(?+) :: (Num a) => a -> a -> a
(?+) a b = a + b

-- class

data TrafficLight = Red | Yellow | Green
instance Eq TrafficLight where
    Red == Red = True
    Green == Green = True
    Yellow == Yellow = True
    _ == _ = False

instance Show TrafficLight where
   show Red = "Red light"
   show Yellow = "Yellow light"
   show Green = "Green light"    

-- yes no
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

instance YesNo (Maybe a) where
   yesno (Just _) = True
   yesno Nothing = False   

instance YesNo TrafficLight where
        yesno Red = False
        yesno _ = True

yesnoIf :: (YesNo y) => y -> a -> a -> a
yesnoIf yesnoVal yesResult noResult = if yesno yesnoVal then yesResult else noResult


mySecond :: [a] -> a
mySecond xs = if null (tail xs)
              then error "lit null"
              else head (tail xs)

safeSecond :: [a] -> Maybe a
safeSecond [] = Nothing
safeSecond xs = if null (tail xs)
                then Nothing
                else Just (head (tail xs))

tidySecond :: [a] -> Maybe a
tidySecond (_:x:_) = Just x
tidySecond _ = Nothing
-- functor
-- class Functor f where
--    fmap :: (a -> b) -> f a -> f b

-- instance Functor [] where
--    fmap = map   