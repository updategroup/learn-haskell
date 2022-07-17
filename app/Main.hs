module Main where
import Curry.CurryDemo as CurryDemo

main :: IO ()
main = do
    -- print(maxList [])
    -- print(replicateD 2 3)
    -- print(takeD 2 [1,2,5,6])
    -- print(zipD [1,2, 6] [1,2])
    -- print(applyTwice (+2) 10)
    print("x")
    print(CurryDemo.multThree 1 2 3)

-- maxList :: (Ord a ) => [a] -> a
-- maxList [] = error "OKI-----------------------"
-- maxList [x] = x
-- maxList (x:xs) = max x (maxList xs)

-- replicateD:: (Integral a) => a -> [b] -> [b]
-- replicateD a b
--         | a <= 0 = []
--         | otherwise = [b] ++ replicateD(a-1) b

-- takeD :: (Integral a) => a -> [b] -> [b]  
-- takeD k _ 
--     | k <=0 = []
-- takeD _ [] = []
-- takeD k (s:sx) = s : takeD(k-1) sx

-- reverseD :: [a] -> [a]
-- reverseD [] = []
-- reverseD (x:sx) = (reverseD sx) ++ [x]

-- zipD :: [a] -> [b] -> [(a,b)]
-- zipD _ [] = []
-- zipD [] _ = []
-- zipD (x:sx) (y:sy) = [(x,y)]++(zipD sx sy)

-- compareWith :: (Num a, Ord a) => a -> Ordering
-- compareWith x = compare 100 x


-- applyTwice :: (a -> a) -> a -> a
-- applyTwice f x = f (f x)


