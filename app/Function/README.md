# PATTERN MATCHING
![plog](/app/Function/image/3-1.png)
- Chỉ định pattern cho từng case sau đó kiểm tra data theo pattern đã cho
# AS PATTERN
![plog](/app/Function/image/3-2.png)
- Đặt tên biến và dấu @ phía trước pattern để lấy list ban đầu
<pre>
capital :: String -> String
capital "" = "Empty"
capital all@(x:sx) = "the" ++ all ++ " is " ++ [x]
</pre>
# GUARD
![plog](/app/Function/image/3-3.png)
Kiểm tra(boolean) thuộc tính nào đó của 1 hoặc nhiều giá trị trong pattern, guard cơ bản là biểu thức bool nếu true phần thân hàm sẽ dùng đến
# WHERE
![plog](/app/Function/image/3-4.png)
Cho phép gán giá trị vào biến ở cuối hàm và toàn bộ hàm có thể thấy được biến đó [Sau where định nghĩa các biến và hàm, các biến này có hiệu lực cho tất cả các guard]
# LET IN
![plog](/app/Function/image/3-5.png)
let là một biểu thức, local, không thể truy cập từ các guard khác
<pre>
ghci> [if 5 > 3 then "wo" else "bo", if 'a'>'b' then 'bo' else 'bar'] = ["wo","bar"]
ghci> 4*(let a = 9 in a + 1) + 2 = 42
ghci> [let square x = x * x in (square 5, square 3, square 2)] = (25, 5, 4)]
ghci> (let a = 100; b = 200; c = 300 in a * b * c, let fo = "HEY"; bar ="thre" in fo ++ bar )
ghci> (let (a,b,c) = (1,2,3) in a+b+c) * 100 = 300
ghci> let zoot x y z = x * y * z
ghci> zoot 3 9 2 = 29
ghci> let boot x y z = x * y * z in boot 3 4 2 = 14
</pre>
# CASE EXPRESSION
![plog](/app/Function/image/3-6.png)


# ZIPWITH
- Nhận vào 1 function và 2 mảng rồi áp dụng function với 2 mảng cho ra mảng mới
<pre>
ghci> zipWith (+) [1,2,3] [3,2,1] = [4,4,4]
ghci> zipWith (**) (replicate 2 5) [1..2] = [5,25]
</pre>

# LAMBDA
- Khi ta cần hàm đó thực hiện rồi bỏ đi như khăn giấy
- Mục đích truyền vào hàm bậc cao
- Sử dụng \ tiếp theo là các tham số sau đó là -> rồi thân hàm và thường bao chúng với cặp ngoặc tròn
<pre>
ghci> zipWith (\x y -> 2 * x + y) [1..4] [5..8] = [7,10,13,16]
ghic> zipWith (\a b -> (a * 30 + 3) / b) [5,4] [1,2] = [153,61.5]
ghci> map (\(a,b) -> a + b) [(1,2), (3,5)] = [3,8]
</pre>

# Foldl-Foldr
- Khi ta làm việc với list, ta có điều kiện với list rỗng sau đó xử lý x:xs thao tác head và sx, điều này lặp lại nhiều lần nên ta có hàm với pattern này(fold có cấu trúc như map khác là rút gọn list thành một giá trị duy nhất
1. Foldl: Gọi là fold trái, nó fold list trừ phía trái, hàm được áp dụng giữa giá trị khởi tạo và head, kết quả tạo ra giá trị mới và hàm được gọi lại với giá trị mới và phần tử kế tiếp
<pre>
sumD :: (Num a) => [a] -> a
sumD xs = foldl (\acc x -> acc + x) 0 xs = sumD foldl (+) 0
ghci> sumD [3,5,2,1] = 11
- (\acc x -> acc + x) = (+)
- foo a = bar b a => foo = b a
foldl (^) 2 [1,2,3] = 64
            ((2 ^ 1)^2)^3 = 64
</pre>


2. Foldr
- Đi từ phải qua
<pre>
foldr :: Foldable t => (a -> b -> b) -> b -> t a ->b
foldr (^) 2 [1,2,3] = 1
            1^(2^(3^2)) = 1
map :: (a -> b) -> [a] -> [b]
map f sx = foldr (\x acc -> f x : acc) [] sx        
map (+3) [1,2,3] = [4,5,6]        
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

# CẤU TRÚC DỮ LIỆU DỆ QUY
<pre>
4:(5:[])=[4,5]
3:(4:(5:6:[]))=3:4:5:6:[]=[3,4,5,6]
</pre>
- : Phép toán này có tính kết phải. Ta nói rằng list có thể là list rỗng hoặc phần tử nối đến list khác
- khi thực thi
<pre>
data List a = Empty | Cons a (List a) deriving (Show, Read, Eq, Ord)
</pre>
- Định nghĩa: List là list rỗng hoặc là tổ hợp của head và 1 list khác
- Biểu diễn record:
<pre>
data List a = Empty | Cons {
    ListHead :: a,
    ListTail :: List a
} deriving (Show, Read, Eq, Ord)
</pre>
- Cons là cách viết khác của :
- Trong list, : là constructor nhận vào giá trị cụ thể và list khác trả về list mới. Hay nói gồm 2 trường có kiểu a và [a]
<pre>
</pre>