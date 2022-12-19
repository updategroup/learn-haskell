
applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

zipWith1 :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith1 _ [] _ = []
zipWith1 _ _ [] = []
zipWith1 f (x:xs) (y:ys) = f x y : zipWith1 f xs ys

flip1 :: (a -> b -> c) -> b -> a -> c
flip1 f y x = f x y

largest :: Integer
largest = head (filter f [10000,999..])
    where f x = x `mod` 3829 == 0

suml :: (Num a) => [a] -> a
suml xs = foldl (\acc x -> x + acc) 0 xs 

-- mapl 
mapl f xs = foldl(\acc x -> f x : acc ) [] xs