
Mục đích tạo ra các hàm khi cần để truyền đến hàm khác. Có thể dùng lambda, nhưng nhiều khi dùng hàm hợp rõ ràng và gọn hơn.

<pre>
f (g x) = (f . g) x

(.) :: (b -> c) -> (a -> b) -> a -> c
f . g = \x -> f (g x)

ghci> map (\x -> negate abs(x)) [1, -2, 4, -8]
ghci> map (negate . abs) [1, -2, 4, -8]

f (g (z x)) = (f . g . z) x

ghci> map (\xs -> negate (sum (tail xs))) [[1..5],[3..6],[1..7]]
ghci> map (negate . sum . tail ) [[1..5],[3..6],[1..7]]
</pre>

Trường hợp hàm nhận nhiều tham số thì phải áp dụng từng phần mỗi hàm chỉ nhận một tham số

<pre>
ghci> sum (replicate 5 max (6.7 8.9))
ghci> (sum . replicate 5 . max 6.7) 8.9
ghci> sum . replicate 5 . max 6.7 $ 8.9
</pre>
