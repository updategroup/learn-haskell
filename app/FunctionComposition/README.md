
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
ghci> replicate 2 (product (map (*3) (zipWith max [1,2,3,4,5] [4,5,6,7,8])))
ghci> replicate 2 . product . map (*3) . zipWith max [1,2,3,4,5] $ [4,5,6,7,8]

fn x = ceiling (negate (tan (cos (max 50 x))))
fn = ceiling . negate . tan . cos . max 50

Tính tổng tất cả bình phương nhỏ hơn 10000 của các số lẻ

oddSquareSum :: Integer
oddSquareSum = sum (takeWhile (<1000) (filter odd (map (^2) [1..])))

oddSquareSum = sum . takeWhile (<1000) . filter odd . map (^2) $ [1..]

oddSquareSum = 
    let oddSquare = filter odd $ map (^2) [1..]
        belowLimit = takeWhile (<1000) oddSquare
    in sum belowLimit     
</pre>
