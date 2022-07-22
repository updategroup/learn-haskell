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

capital :: String -> String
capital "" = "Emty"
capital all@(x:sx) = "this is " ++ all ++ " is " ++ [x]

bmiTell :: (RealFloat a) => a -> a -> String
bmiTell w h
        | w / h ^ 2 <= 18.5 = "Om"
        | otherwise = "Map"


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


