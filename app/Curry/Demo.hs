module Curry.Demo where
    
multThree :: (Num a) => a -> a -> a ->a 
multThree x y z = x * y * z

compareWithHundred :: (Num a, Ord a) => a -> Ordering
-- compareWithHundred x = compare 100 x
compareWithHundred = compare 100

divideByTen :: (Floating a) => a -> a
divideByTen = (/10)

isUpperAlphanum :: Char -> Bool
isUpperAlphanum = (`elem` ['A'..'Z'])

-- Hight Function

applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

zipWithD :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWithD _ [] _ = []
zipWithD _ _ [] = []
zipWithD f (x:xs) (y:ys) = f x y : zipWithD f xs ys

flipD :: (a -> b -> c) -> b -> a -> c
flipD f y x = f x y

-- MAP
mapD :: (a -> b) -> [a] -> [b]
mapD _ [] = []
mapD f (s:sx) = f s : mapD f sx


-- FILTER
filterD :: (a -> Bool) -> [a] -> [a]
filterD _ [] = []
filterD p (x:sx)
    | p x = x : filterD p sx
    | otherwise = filterD p sx

-- largestDivisible :: (Integral a) => [a]
-- largestDivisible = head (filter p [100000,99999..])
--     where p x = x `mod` 3829 == 0 

chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain n
    | even n = n:chain (n `div` 2)
    | odd n = n:chain (n*3 +1)    

numLongChains :: Int
numLongChains = length (filter isLong (map chain [1..100]))
    where isLong xs = length xs > 15