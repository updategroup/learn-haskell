
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
-- suml1 = foldl (+) 0

mapl :: (a -> b) -> [a] -> [b]
mapl f xs = foldl(\acc x -> acc ++ [f x] ) [] xs
mapr f xs = foldr(\x acc -> f x : acc) [] xs

eleml :: (Eq a) => a -> [a] -> Bool
eleml n = foldl(\acc x -> if n == x then True else acc) False
-- elemr n xs = foldr(\x acc -> if n == x then True else acc) False xs

maximuml1 :: (Ord a) => [a] -> a
maximuml1 xs = foldl1 max xs

reverse1 :: [a] -> [a]
reverse1 xs = foldl(\acc x -> x : acc) [] xs
-- reverse1 = foldl (flip (:)) []

productl1 :: (Num a) => [a] -> a
productl1 xs = foldl(\acc x -> x * acc) 1 xs

filterl1 :: (a -> Bool) -> [a] -> [a]
filterl1 f xs = foldl(\acc x -> if f x == True then acc ++ [x] else acc) [] xs

lastl1 :: [a] -> a
lastl1 xs = foldl1(\_ x -> x) xs