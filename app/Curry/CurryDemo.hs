module Curry.CurryDemo where
    
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
mapD f (s: sx) = f s : mapD f sx
