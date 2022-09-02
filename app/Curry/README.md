# Curry
Trong haskell hàm chỉ nhận 1 tham số, nếu nhiều hơn ta gọi là curried function
<pre>
max :: (Ord a) => a -> a -> a
tương đương với
max :: (Ord a) => a -> (a -> a)
ghci> max 4 5 = (max 4) 5
</pre>
Hàm max nhận vào đối tượng kiểu a rồi trả về một hàm. Hàm này cũng nhận đối tượng kiểu a rồi trả về đối tượng cùng kiểu
<pre>
multThree :: (Num a) => a -> a -> a ->a 
multThree x y z = x * y * z
tương đương với
multThree :: (Num a) => a -> (a -> (a -> a)) 
= (Num a) => a -> (a -> a) 
= (Num a) => a -> a

ghci> let multTwoWithNine = multThree 9
ghci> multTwoWithNine 2 3
ghci> let multWithEighteen = multTwoWithNine 2
ghci> multWithEighteen 10
</pre>

# HIGH FUNCTION
Hàm có thể nhận hàm khác làm tham số rồi trả về hàm
<pre>
applyTwice :: (a -> a) -> a -> a
applyTwice f x = f (f x)

ghci> applyTwice (+3) 10 = 16
ghci> applyTwice (++ " HAHA") "HEY" = "HEY HAHA HAHA"
ghci> applyTwice ("HAHA " ++) "HEY" = "HAHA HAHA HEY"
ghci> applyTwice (multThree 2 2) 9 = 144
ghci> applyTwice (3:) [1] = [3,3,1]

zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith _ [] = []
zipWith [] _ = []
zipWith f (x:xs) (y:ys) = f x y : zipWith f xs ys

ghci> zipWith (+) [4, 2, 5, 6] [2, 6, 2, 3] = [6, 8, 7, 9]
ghci> zipWith max [6, 3, 2, 1] [7, 3, 1, 5] = [7, 3, 2, 5]
ghci> zipWith (++) ["foo ", "bar ", "baz "] ["fighters", "hoppers", "aldrin"] = ["foo fighters", "bar hoppers"]
ghci> zipWith (*) (replicate 5 2) [1..] = [5, 4, 6, 8, 10]

flip nhận vào một hàm rồi trả về một hàm mới giống như hàm ban đầu, chỉ khác là hai đối số đã bị đổi chỗ

flip :: (a -> b -> c) -> (b -> a -> c)
flip f = g
    where g x y = f y x

Nhận một hàm, hàm này nhận a,b rồi trả về hàm nhận b,a
(b -> a -> c) = (b (a -> c)) = b -> a -> c
g x y = f y x <=> f y x = g x y

flip :: (a -> b -> c) -> b -> a -> c
flip f y x = f x y

ghci> flip zip [1, 2] "he" = [("h", 1), ("e", 2)]
</pre>

# MAP
Nhận vào hàm và list rồi áp dụng hàm đó từng phần tử thuộc list cho ra list mới
<pre>
map :: (a -> b) -> [a] -> [b]
map _ [] = []
map f (x:xs) = f x : map f xs

ghci> (+3) [1, 5] = [4, 8]
ghci> map (++ "!") ["BIFF", "BANG", "POW"] = ["BIFF!", "BANG!", "POW!"] 
ghci> map (replicate 3) [3,4] = [[3, 3, 3], [4, 4, 4]]
map (map (^2)) [[1,2],[3,5]] = [[1,4],[9,25]]
map fst [(1,3,(3,5),(4,7)] = [1,3,4]
</pre>

# FILTER
Nhận vào điều kiện boolean và list rồi trả về list khi các phần tử trong list thoả mãn điều kiện boolean

<pre>
filter :: (a -> Bool) -> [a] -> [a]
filter _ [] = []
filter p (x:sx)
    | p x = x : filter p sx
    | otherwise = filter p sx

ghci>filter (==3) [1,3,5,2] = [3,5]
takeWhle (/=' ') "love you" = love
ghci>sum (takeWhile (<10) (filter odd (map (^2) [1..]))) = 10
ghci>filter (`elem` ['a'..'z']) "u La Bcaj"
ghci>let listOfFuns = map (*) [0..]
ghci>(listOfFuns !! 4) 5 = 20
</pre>



