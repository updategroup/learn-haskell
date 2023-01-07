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

- Nếu một hành động I/O mà thực hiện nhảy ra môi trường ngoài và lấy cho ta một chuỗi nào đó mà nó trả lại kết quả ta có thể dùng <- trong do để gắn kết quả vào tên gọi

<pre>
main = do
    line <- getLine
    let lines = reverse line
</pre>

<pre>
main = do
    line <- fmap reverse getLine
</pre>

<pre>
import Data.Char
import Data.List

main = do
    line <- fmap (intersperse "-" . reverse . map toUpper) getLine
</pre>

# Hàm như Functors (->) r

- Kiểu hàm r -> a có thể được viết thành (->) r a, như 2 + 3 thành (+) 2 3, (r -> a) coi nó là (->) r, (2+) = (+) 2, (->) r = (r ->).

<pre>
instance Functor ((->) r) where
    fmap f g = (\x -> f (g x))

fmap :: (a -> b) -> f a -> f b
fmap :: (a -> b) -> ((->) r a) -> ((->) r b)
fmap :: (a- > b) -> (r -> a) -> (r -> b)   => Hàm hợp

instance Functor ((->) r) where
    fmap = (.)

ghci> :t fmap (*3) (+100) = fmap (*3) (+100) :: (Num a) => a -> a
ghci> fmap (*3) (+100) 1 = 303
ghci> (*3) `fmap` (+100) $ 1 = 303
ghci> (*3) . (+100) $ 1 = 303
ghci> fmap (show . (*3)) (+100) 1 = "303"    
</pre>