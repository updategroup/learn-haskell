--comprehensition
list1 = [x*2 | x <- [1..10]]

list2 = [x | x <- [50..100], x `mod` 7 == 3]

boomBangs xs = [if x > 10 then "Boom" else "Bangs" | x <- xs, odd x]

list3 xs = [x | x <- xs, x /= 3, x /= 5, odd x]

list4 xs ys = [x*y | x <- xs, y <- ys]

list5 xs ys = [x*y | x <- xs, y <- ys, x*y > 50]

list6 = [a ++ " " ++ b | a <- ["1", "hi"], b <- ["a1", "b2"]]

list7 = [a + b | (a, b) <- [(1,3), (5,6), (6,12)]]

length1 xs = sum [1 | _ <- xs]

length2 :: (Num a) => [a] -> a
length2 [] = 0
length2 (_:xs) = 1 + length2 xs -- length2 "ham" = 1 + length "am" = 1 + (1 + (length "m")) = 1 + (1 + (1 + length2 "")) = 1 + (1 + (1 + 0)) 

sum1 :: (Num a) => [a] -> a
sum1 [] = 0
sum1 (x:xs) = x + sum1 xs

removeNonUpperCase xs = [x | x <- xs, x `elem` ['A' .. 'Z']]

-- pattern matching
lucky :: (Integral a) => a -> String
lucky 7 = "You are lucky"
lucky x = "Not lucky"

sayMe :: (Integral a) => a -> String
sayMe 1 = "This is One"
sayMe 2 = "This is two"
sayMe 3 = "This is three"
sayMe x = "Not between 1, 3"

factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)

charName :: Char -> String
charName 'a' = "Apple"
charName 'b' = "Bot"

addVectors1 :: (Num a) => (a,a) -> (a,a) -> (a,a)
addVectors1 a b = (fst a + fst b, snd a + snd b)

addVectors2 :: (Num a) => (a,a) -> (a,a) -> (a,a)
addVectors2 (x,y) (x1,y1) = (x+x1, y+y1)

first :: (a, b, c) -> a
first (a, _, _) = a

second :: (a, b, c) -> b
second (_, b, _) = b

third :: (a, b, c) -> c
third (_, _, c) = c

head1 :: [a] -> a
head1 [] = error "List not empty"
head1 (x:xs) = x

tell :: (Show a) => [a] -> String
tell [] = "List is Empty"
tell ([x]) = "this is one " ++ show x
tell ([x,y]) = "this is two"
tell (x:y:_) ="this is many"