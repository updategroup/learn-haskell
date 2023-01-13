<pre>
class Functor f where
    fmap :: (a -> b) -> f a -> f b
</pre>
- Hàm nhận a và trả lại b, cùng một hộp với một hoặc nhiều a bên trong nó rồi sẽ trả lại một hộp với một hoặc nhiều b trong đó. Nó áp dụng hàm vào trong các phần tử bên trong cái hộp.
- Danh sách là một phần của lớp kiều Funtor. Lớp này dành cho những thứ có thể được ánh xạ.
- f là một phương thức khởi tạo kiểu nhận một tham số kiểu.
- fmap nhận một hàm từ kiểu này sang kiểu khác và một giá trị hàm được áp dụng với một kiểu và trả về giá trị hàm được áp dụng với kiểu khác.
- fmap chỉ là map khi f đó là []

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
fmap :: (a -> b) -> (r -> a) -> (r -> b)   => Hàm hợp

instance Functor ((->) r) where
    fmap = (.)

ghci> :t fmap (*3) (+100) = fmap (*3) (+100) :: (Num a) => a -> a
ghci> fmap (*3) (+100) 1 = 303
ghci> (*3) `fmap` (+100) $ 1 = 303
ghci> (*3) . (+100) $ 1 = 303
ghci> fmap (show . (*3)) (+100) 1 = "303"    

fmap :: (Functor f) => (a -> b) -> f a -> f b
</pre>

<pre>
fmap :: (a -> b) -> (f a -> f b)
</pre>

- fmap không phải là một hàm nhận một hàm khác là một functor rồi trả về functor mới, mà là một hàm nhận vào một hàm rồi trả lại hàm mới gần giống cũ, chỉ khác nó nhận tham số là một functor rồi trả lại kết quả là một functor.

<pre>
ghci> :t fmap (*2) = fmap (*2) :: (Num a, Functor f) => f a -> f a
ghci> :t fmap (replicate 3) = fmap (replicate 3) :: (Functor f) => f a -> f [a]
</pre>

- Có thể hình dung fmap là một hàm nhận hàm khác và một functor rồi ánh xạ hàm khác đó lên functor, hoặc cũng có thể hình dung nó như một hàm nhận một hàm khác rồi nâng hàm đó lên để nó hoạt động được với các functor.

<pre>
ghci> fmap (replicate 3) [1,2] = [[1,1], [2,2]]
ghci> fmap (replicaet 3) (Just 4) = Just [4,4,4]
ghci> fmap (replicate 3) (Right "bla") = Right ["bla","bla","bla"]
ghci> fmap (replicate 3) Nothing = Nothing
ghci> fmap (replicate 3) (Lèt "foo") = Left "foo"
</pre>

# Luật Functor

- Có 2 luật

1. Nếu ta ánh xạ hàm id lên một functor, thì functor mà ta thu được phải giống vơi functor ban đầu

<pre>
ghci> fmap id (Just 3) = Just 3
ghci> id (Just 3) = Just 3
ghci> fmap id [1..5] = [1,2,3,4,5]
ghci> id [1..3] = [1,2,3]
ghci> fmap id [] = []
ghci> fmap id Nothing = Nothing

instance Functor Maybe where
    fmap f (Just x) = Just (f x)
    fmap f Nothing = Nothing
</pre>

2. Hợp hai hàm rồi ánh xạ hàm kết quả lên một functor phải giống như với việc đầu tiền là ánh xạ một hàm lên functor rồi ánh xạ hàm thứ hai.

<pre>
fmap (f . g) = fmap f . fmap g
fmap (f . g) F = fmap f (fmap g F)
</pre>