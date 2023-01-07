<pre>
class Functor f where
    fmap :: (a -> b) -> f a -> f b
</pre>

- Danh sách là một phần của lớp kiều Funtor. Lớp này dành cho những thứ có thể được ánh xạ
- fmap nhận một hàm từ kiểu này sang kiểu khác và một giá trị hàm được áp dụng với một kiểu và trả về giá trị hàm được áp dụng với kiểu khác