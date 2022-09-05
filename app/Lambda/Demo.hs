listNumber = [x | x <- [1..4]]
lambda1 = filter (\x -> x > 3) listNumber

chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain n
    | even n =  n:chain (n `div` 2)
    | odd n  =  n:chain (n*3 + 1)

numLongChains ::  Int
numLongChains = length (filter (\xs -> length xs > 15) (map chain [1..10])) 

lambda2 = zipWith (\a b  -> b/a) [1, 2, 3] [4, 5, 6]

sum1 :: (Num a) => [a] -> a
sum1 xs = foldl (\acc x -> acc + x) 0 xs

elem1 :: (Eq a) => a -> [a] -> Bool
elem1 y ys = foldl (\acc x -> if x == y then True else acc) False ys
-- elem1 y ys = foldr (\x acc -> if x == y then True else acc) False ys

map1 :: (a -> b) -> [a] -> [b]
-- map1 f xs = foldr (\x acc -> f x : acc) [] xs
map1 f xs = foldl (\acc x -> acc ++ [f x]) [] xs

maximum1 :: (Ord a) => [a] -> a
maximum1 (x:xs) = foldl max x xs

maximum2 :: (Ord a) => [a] -> a
maximum2 = foldr1 (\x acc -> if x > acc then x else acc)

reserve1 :: [a] -> [a]
reserve1 = foldr (\x acc -> acc ++ [x]) []

product1 :: (Num a) => [a] -> a
product1 = foldr1 (\x acc -> (x * acc))

filter1 :: (a -> Bool) -> [a] -> [a]
filter1 f = foldr (\x acc -> if f x then x:acc else acc) []

head1 :: [a] -> a
head1 = foldr1 (\x _ -> x)

last1 :: [a] -> [a]
last1 = foldl1 (\_ x -> x)