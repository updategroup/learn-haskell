module Function.Demo where

lucky :: (Integral a) => a -> String
lucky 7 = "THIS IS 7"
lucky x = "NOT 7"
    

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


