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


</pre>

# MAP
- Nhận vào hàm và list rồi áp dụng hàm đó từng phần tử thuộc list cho ra list mới
<ul>
    <li>map (+3) [1,5,3] = [4,8,6]</li>
    <li>map (++ "!") ["BIFF", "BANG"] = ["BIFF!","BANG!"]</li>
    <li>map (replicate 3) [3..5] = [[3,3,3], [4,4,4], [5,5,5]</li>
    <li>map (map (^2)) [[1,2],[3,5]] = [[1,4],[9,25]]</li>
    <li>map fst [(1,3,(3,5),(4,7)] = [1,3,4]</li>
</ul>
Ta có thể định nghĩa lại nó như saus:
<pre>
    myMap:: (a -> b) -> [a] -> [b]
    myMap _ [] = []
    myMap f (x: xs) = f x : myMap f xs
</pre>

# FILTER
- Nhận vào điều kiện boolean và list rồi trả về list khi các phần tử trong list thoả mãn điều kiện boolean

<pre>
    filter :: (a -> Bool) -> [a] -> [a]
    filter _ [] = []
    filter p (x:sx)
        | p x = x : filter p sx
        | otherwise = filter p sx
</pre>
<ul>
<li>filter (>3) [1,3,5,2,8] = [5,8]</li>
<li>filter (==3) [1,3,5,2] = [3,5]</li>
<li>filter (`elem` ['a'..'z']) "u La Bcaj"</li>
<li>takeWhle (/=' ') "love you" = love </li>
<li>sum (takeWhile (<10) (filter odd (map (^2) [1..]))) = 10</li>
<li>sum (takeWhile (<10) [n ^ 2 | n <- [1..], odd (n ^ 2)]) = 10 </li>
<li>
<pre>ghci>let listOfFuns = map (*) [0..]
ghci> (listOfFuns !! 4) 5 = 20
</pre>
</ul>



