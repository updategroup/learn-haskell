maximum1 ::(Ord a)=> [a] -> a
maximum1 [] = error "Loi"
maximum1 [x] = x
maximum1 (x:xs) = max x (maximum1 xs)


replicate1 :: Int -> a -> [a]
replicate1 n x
        | n <= 0 = []
        | otherwise = x : replicate1 (n-1) x


take1 :: Int -> [a] -> [a]
take1 n _
    | n <= 0 = []
take1 _ [] = []
take1 n (x:xs)=x:take1(n-1) xs    


reverse1 :: [a] -> [a]
reverse1 [] = []
reverse1 (x:xs) = (reverse1 xs) ++ [x]

zip1 :: [a] -> [b] -> [(a,b)]
zip1 [] _ = []
zip1 _ [] = []
zip1 (x:xs) (y:ys) = (x,y) : zip1 xs ys

elem1 :: (Eq a) => a -> [a] -> Bool
elem1 _ [] = False
elem1 a (x:xs)
    | a == x = True
    | otherwise = a `elem1` xs


quictsort:: (Ord a) => [a] ->[a]
quictsort [] = []
quictsort (x:xs) = 
    let small = [a | a <- xs, a <= x]
        larg = [a | a <- xs, a > x]
    in quictsort small ++ [x] ++ quictsort larg    