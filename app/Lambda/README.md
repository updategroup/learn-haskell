# LAMBDA 
là hàm vô danh xuất phát từ giải tich Lambda, có cú pháp thuận tiện khi cần dùng một hàm nào đó rồi bỏ ngay. Mục đích truyền vào hàm bậc cao hơn. Ta sử dụng dấu \ tiếp theo là các tham số, được ngăn bởi dấu cách. Sau đó là dấu -> rồi đến thân hàm. Ta thường bao chúng với cặp ngoặc tròn.

<pre>
listNumber = [x | x <- [1..4]]
lambda1 = filter (\x -> x > 3) listNumber

Kiểu như vậy rất thừa thải chỉ cần (>3) là đủ hay
(\x -> x + 3) = (+3)

chain :: (Integral a) => a -> [a]
chain 1 = [1]
chain n
    | even n =  n:chain (n `div` 2)
    | odd n  =  n:chain (n*3 + 1)

numLongChains :: Int
numLongChains = length (filter (\xs -> length xs > 15) (map chain [1..10]) 

ghci> zipWith (\a b -> b/a) [1,2,3] [4,5,6] = [4.0, 2.5, 2.0]
ghci> map (\(a, b) -> a + b) [(1,2), (3,5)] = [4, 8]

sum :: (Num a) -> [a] -> a
sum xs = foldl (\acc x -> acc + x) 0 xs
<=> sum foldl (+) 0

foo a = bar b a
<=> foo = bar b

map :: (a -> b) -> [a] -> [b]
map f xs = foldr (\x acc -> f x : acc) [] xs

ghci> map (+1) [1, 2]
= 2 foldr (+1) [] (2:[]) = 2 : []
= 2 
</pre>

# SCANL SCANR
Giống fold nhưng xuất ra trạng thái trung gian của giá trị tích luỹ dưới dạng List.

ghci> scanl (+) 0 [3, 5, 2, 1] = [0, 3, 8, 10, 11]
ghci> scanr (+) 0 [3, 5, 2, 1] = [1, 3, 8, 11, 0]
ghci> scanl1 (\acc x -> if x > acc then x else acc) [3,4,5,3,7,9,2,1] = [3,4,5,5,7,9,9,9]

# $
Áp dụng hàm với $ có tinh kết phải
Trong số trường hợp một hàm đỡ viết ()
Ngoài ra $ còn mang ý nghĩa áp dụng hàm chính là hàm
<pre>
ghci> sum (map sqrt [1..130])
ghci> sum $ map sqrt [1..30]
ghci> sqrt (3+4+9)
ghci> sqrt $ 3 + 4 + 9
ghci> sum $ filter (>10) $ map (*2) [2..10]
ghci> map ($ 3) [(4+), (10*), (^2), sqrt] = [7,30,9,1.7]
</pre>
