<pre>
class Functor f where
    fmap :: (a -> b) -> f a -> f b
</pre>

- Danh sách là một phần của lớp kiều Funtor. Lớp này dành cho những thứ có thể được ánh xạ.
- f là một phương thức khởi tạo kiểu nhận một tham số kiểu.
- fmap nhận một hàm từ kiểu này sang kiểu khác và một giá trị hàm được áp dụng với một kiểu và trả về giá trị hàm được áp dụng với kiểu khác.
- fmap chỉ là map

<pre>
instane Funtor [] where
    fmap = map

ghci> map (*2) [1..3] = [2,4,6]
ghci> fmap (*2) [1..3] = [2,4,6]
</pre>

- Không thể là [a] vì a là kiểu cụ thể, nên [] là khởi tạo giá trị

# Maybe là một Funtor

<pre>
instance Funtor Maybe where
    fmap f (Just x) = Just (f x)
    fmap f Nothing = Nothing

ghci> fmap (++ " Hey") (Just "Some") = Just "Some Hey"
ghci> fmap (*2) Nothing = Nothing
ghci> fmap (*2) (Just 2) = Just 4
</pre>

Xem dạng của một kiểu
:k Int = Int :: *
- * Nghĩa là kiểu dữ liệu là một kiểu cụ thể
- Một kiểu cụ thể là kiểu mà nó không nhận bất kỳ tham số kiểu nào và giá trị chỉ có thể có kiểu nằm trong các kiểu cụ thể.
:k Maybe = Maybe :: * -> *
Xem thể hiện của class
:info Maybe


- Ta đã có các thực thể như [], Maybe, Either a..., sẽ có thêm 2 thực thể nữa IO và (->) r

# IO hành động như Functors

