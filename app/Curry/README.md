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
<li>
<pre>ghci>let listOfFuns = map (*) [0..]
ghci> (listOfFuns !! 4) 5 = 20
</pre>
</ul>

# ZIPWITH
- Nhận vào 1 function và 2 mảng rồi áp dụng function với 2 mảng cho ra mảng mới
<pre>
ghci> zipWith (+) [1,2,3] [3,2,1] = [4,4,4]
ghci> zipWith (**) (replicate 2 5) [1..2] = [5,25]
</pre>

# LAMBDA
- Khi ta cần hàm đó thực hiện rồi bỏ đi như khắn giấy
- Mục đích truyền vào hàm bậc cao
- Sử dụng \ tiếp theo là các tham số sau đó là -> rồi thân hàm và thường bao chúng với cặp ngoặc tròn
<pre>
ghci> zipWith (\x y -> 2 * x + y) [1..4] [5..8] = [7,10,13,16]
ghic> zipWith (\a b -> (a * 30 + 3) / b) [5,4] [1,2] = [153,61.5]
ghci> map (\(a,b) -> a + b) [(1,2), (3,5)] = [3,8]
</pre>

# Foldl-Foldr
[Nguyên nhân]
- Khi ta làm việc với list, ta có điều kiện với list rỗng sau đó xử lý x:xs thao tác head và sx, điều này lặp lại nhiều lần nên ta có hàm với pattern này(fold có cấu trúc như map khác là rút gọn list thành một giá trị duy nhất
- [Foldl]: Gọi là fold trái, nó fold list trừ phía trái, hàm được áp dụng giữa giá trị khởi tạo và head, kết quả tạo ra giá trị mới và hàm được gọi lại với giá trị mới và phần tử kế tiếp
<pre>
sumD :: (Num a) => [a] -> a
sumD xs = foldl (\acc x -> acc + x) 0 xs
ghci> sumD [3,5,2,1] = 11
</pre>

# $
Áp dụng hàm với $ có tinh kết phải
Trong số trường hợp một hàm đỡ viết ()
Ngoài ra $ còn mang ý nghĩa áp dụng hàm chính là hàm
<pre>
ghci> sum $ map sqrt [1..30]
ghci> sum $ filter (>10) $ map (*2) [2..10]
ghci> map ($ 3) [(4+), (10*), (^2), sqrt] = [7,30,9,1.7]
</pre>


