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

take1 :: (Integral a) => a -> [b] -> [b]
take1 k _
    | k <= 0 = []
take1 _ [] = []    
take1 k (x:xs)= x:take1(k-1) xs

reserve1 :: [a] -> [a]
reserve1 [] = []
reserve1 (x:xs) = reserve1 xs ++ [x]

maximum2 :: (Ord a) => [a] -> a
maximum2 [] = error "list not empty"
maximum2 [x] = x
maximum2 (x:xs) = max x (maximum2 xs)

zip1 :: [a] -> [b] -> [(a,b)]
zip1 _ [] = []
zip1 [] _ = []
zip1 (x:xs) (y:ys) = (x, y) : zip1 xs ys
--as pattern
capital :: String -> String
capital "" = "List empty"
capital allxs@(x:xs) = "this is list " ++ allxs ++ " "++ [x]

--guard
bmiTell :: (RealFloat a) => a -> String
bmiTell bmi
    | bmi <= 18.5 = "You emo"
    | bmi <= 25.0 = "You are nomor"
    | bmi <= 30.0 = "You are fat"
    | otherwise = "You are whale"

bmiTell1 :: (RealFloat a) => a -> a -> String
bmiTell1 weight height
    | weight / height ^ 2 <= 18.5 = "You are emo"
    | weight / height ^ 2 <= 25.5 = "You are nomor"
    | weight / height ^ 2 <= 30.0 = "You are fat"
    | otherwise = "You are whale"

max1 :: (Ord a) => a -> a -> a
max1 a b
    | a > b = a
    | otherwise = b

myCompare :: (Ord a) => a -> a -> Ordering
a `myCompare` b
    | a > b = GT
    | a == b = EQ
    | otherwise = LT

replicate1 :: (Integral a) => a -> b -> [b]
replicate1 k x
    | k <= 0 = []
    | otherwise = x : replicate1(k-1) x

elem1 :: (Eq a) => a -> [a] -> Bool  
elem1 _ [] = False
elem1 a (x:xs)
    | a == x = True
    | otherwise = elem1 a xs      

-- where
bmiTell2 :: (RealFloat a) => a -> a -> String
bmiTell2 weight height
    | bmi <= 18.5 = "You are emo"
    | bmi <= 25.5 = "You are nomor"
    | bmi <= 30.0 = "You are fat"
    | otherwise = "you are whale"
    where bmi = weight / height ^ 2

bmiTell3 :: (RealFloat a) => a -> a -> String
bmiTell3 weight height
    | bmi <= skinny = "You are emo"
    | bmi <= normal = "You are nomor"
    | bmi <= fat = "You are fat"
    | otherwise = "You are whale"
    where
    bmi = weight / height ^ 2
    (skinny, normal, fat) = (18.5, 25.0, 30.0)
    -- skinny = 18.5
    -- normal = 25.0
    -- fat = 30.0    

initials :: String -> String -> String
initials firtName lastName = [f] ++ " . " ++ [l]
    where
    (f:_) = firtName
    (l:_) = lastName

describeList :: [a] -> String
describeList xs = "The list is " ++ what xs
    where
    what [] = "empty"
    what [x] = "a singleton list"
    what xs = "a longer list"    

maximum1 :: (Ord a) => [a] -> a
maximum1 [] = error "list not empty"
maximum1 [x] = x
maximum1 (x:sx)
    | x > maxTail = x
    | otherwise = maxTail
    where maxTail = maximum1 sx
   
-- let in
cylinder :: (RealFloat a) => a -> a -> a
cylinder r h = 
    let sideArea = 2 * pi * r * h
        topArea = pi * r ^ 2
    in sideArea + 2 * topArea  

letin1 = 4 * (let a = 9 in a + 1) + 2  
letin2 = [let square x = x * x in (square 5, square 3, square 2)]  
letin3 = (let a=100;b=200;c=300 in a*b*c, let a ="Hey "; b = "there!" in a ++ b)
letin4 = (let (a,b,c) = (1,2,3) in a+b+c) * 100

--case expression
head2 :: [a] -> a
head2 xs = case xs of [] -> error "List no empty"
                      (x:_) -> x

describeList1 :: [a] -> String
describeList1 xs = case xs of [] -> "emplty"
                              [x] -> "singleton"
                              xs -> "long list"

sort1 :: (Ord a) => [a] -> [a]
sort1 (x:xs) = 
    let small1 = [a | a <- xs, a <= x ]
        big1 = [b | b <- xs, b > x]
    in small1 ++ [x] ++ big1           

divideByTen :: (Floating a) => a -> a
divideByTen = (10/)    