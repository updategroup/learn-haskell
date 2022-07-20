# Curry
# MAX
<ul>
    <li>ghci> max 4 5</li>
    <li>=> type: max :: (Ord a) => a -> a -> a</li>
    <li>ghci>(max 4) 5</li>
    <li>=> type: max :: (Ord a) => a -> (a -> a)</li>
</ul>

# MAP
- Nhận vào hàm và list rồi áp dụng hàm đó từng phần tử thuộc list cho ra list mới
<pre>
    map:: (a -> b) -> [a] -> [b]
    map _ [] = []
    map f (x: xs) = f x : map f xs
</pre>
<ul>
    <li>map (+3) [1,5,3] = [4,8,6]</li>
    <li>map (++ "!") ["BIFF", "BANG"] = ["BIFF!","BANG!"]</li>
    <li>map (replicate 3) [3..5] = [[3,3,3], [4,4,4], [5,5,5]</li>
    <li>map (map (^2)) [[1,2],[3,5]] = [[1,4],[9,25]]</li>
    <li>map fst [(1,3,(3,5),(4,7)] = [1,3,4]</li>
</ul>

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

</ul>

