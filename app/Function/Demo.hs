module Function.Demo where

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

-- let in          
cylinder :: (RealFloat a) => a -> a -> a
cylinder r h =
        let sideArea = 2 * pi * r * h
        -- topArea = 8
        in sideArea + 2 * 3

-- case expression
headC :: [a] -> a
headC xs = case xs of [] -> error "No head empty"
                      (x:_) -> x

-- describeList :: [a] -> String
-- describeList xs = "The List is " ++ case xs of [] -> "Emty"
--                                                [x] -> "a singeleton list"
--                                                         xs -> "a long list"                 

describeList :: [a] -> String
describeList xs = "The List is " ++ what xs
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