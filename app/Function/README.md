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
- Bởi vì biểu thức let in là cục bộ nên việc khai báo bên ngoài rồi ápd ụng vô bên trong sẽ không được
<pre>
data Fruit = Apple | Orange
-- apple = "apple"
-- orange = "orange"

wichFruit :: String -> Fruit
wichFruit f = case f of
                "apple" -> Apple
                "orange" -> Orange
</pre>
# CASE EXPRESSION
![plog](/app/Function/image/3-6.png)
<pre>
case expression of pattern -> result
                   pattern -> result

 head :: [a] -> a
 head xs = case xs of [] -> error "List not emply"
                      (x:_) -> x                  
</pre>


# ZIPWITH
- Nhận vào 1 function và 2 mảng rồi áp dụng function với 2 mảng cho ra mảng mới
<pre>
ghci> zipWith (+) [1,2,3] [3,2,1] = [4,4,4]
ghci> zipWith (**) (replicate 2 5) [1..2] = [5,25]
</pre>



# FOLDL
- Khi ta làm việc với list, ta có điều kiện với list rỗng sau đó xử lý x:xs thao tác head và sx, điều này lặp lại nhiều lần nên ta có hàm với pattern này(fold có cấu trúc như map khác là rút gọn list thành một giá trị duy nhất

1. Foldl: Gọi là fold trái, nó fold list trừ phía trái, hàm được áp dụng giữa giá trị khởi tạo và head, kết quả tạo ra giá trị mới và hàm được gọi lại với giá trị mới và phần tử kế tiếp (Hàm foldl có một hàm bước, một giá trị ban đầu cho bộ tích luỹ của nó và một danh sách. Bước lấy một bộ tích luỹ và một phần tử từ danh sách và trả về một giá trị bộ tích luỹ mới)

<pre>
foldl :: (a -> b -> a) -> a -> [b] -> a
sumD :: (Num a) => [a] -> a
sumD xs = foldl (\acc x -> acc + x) 0 xs = sumD foldl (+) 0
ghci> sumD [3,5,2,1] = 11
- (\acc x -> acc + x) = (+)
- foo a = bar b a => foo = b a
foldl (^) 2 [1,2,3] = 64
            ((2 ^ 1)^2)^3 = 64

niceSum :: [Integer] -> Interger
niceSum xs = foldl (+) 0 xs
ghci> niceSum [1,2,3]
= foldl (+) 0 (1:2:3:[])
= foldl (+) (0+1) (2:3:[])
= foldl (+) ((0+1)+2) (3:[])
= foldl (+) (((0+1)+2)+3) []
= (((0+1)+2)+3)            
</pre>


# FOLDR
- Đi từ phải qua và dấu ngoặc đơn sẽ ở bên phải, giá trị tích luỹ phía phải
<pre>
foldr :: Foldable t => (a -> b -> b) -> b -> t a ->b
foldr :: (a -> b -> b) -> b -> [b] -> b
foldr (^) 2 [1,2,3] = 1
            1^(2^(3^2)) = 1
map :: (a -> b) -> [a] -> [b]
map f sx = foldr (\x acc -> f x : acc) [] sx        
map (+3) [1,2,3] = [4,5,6]    

foldr (+) 0 (1:2:3:[])
= 1 + foldr (+) 0 (2:3:[])
= 1 + (2 + foldr (+) 0 (3:[]))
= 1 + (2 + (3 + foldr (+) 0 []))
= 1 + (2 + (3 + 0))

myFilter p xs = foldr step [] xs
   where step x ys | p x = x : ys
                   | otherwise = ys

Tạo ra bản sao
identity :: [a] -> [a]      
identity xs = foldr (:) [] xs         
ghci> identity [1,2,3] = [1,2,3]      

Nối mảng như
ghci> [1,2,3] ++ [4,5,6]= [1,2,3,4,5,6]
append :: [a] -> [a] -> [a]
append xs ys = foldr (:) ys xs
ghci> append [1,2,3] [4,5,6] = [1,2,3,4,5,6]
</pre>


# CẤU TRÚC DỮ LIỆU ĐỆ QUY
<pre>
4:(5:[])=[4,5]
3:(4:(5:6:[]))=3:4:5:6:[]=[3,4,5,6]
</pre>
- : Phép toán này có tính kết phải. Ta nói rằng list có thể là list rỗng hoặc phần tử nối đến list khác
- Khi thực thi:
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
ghci> Empty = Empty
ghci> 5 `Cons` Empty
ghci> 4 `Cons` (5 `Cons` Empty)
ghci> 3 `Cons` (4 `Cons` (5 `Cons` Empty))=3:(4:(5:[]))

Cons = :-:

infixr 5 :-:
data List a = Empty | a :-: (List a) deriving (Show, Read, Eq, Ord)
</pre>
<pre>
ghci>3:-:4:-:5:-:Empty=(:-:) 3 ((:-:) 4 ((:-:) 5 Empty))

infixr 5 .++
(.++) :: List a -> List a -> List a
Empty .++ ys = ys
(x :-: xs ) .++ ys = x :-: (xs .++ ys)


ghci> let a = 3 :-: 4 :-: Empty
ghci> let b = 6 :-: 7 :-: Empty
ghci> a .++ b = 3:-:(4:-:(6:-:(7:-:Empty)))
</pre>

# Class

<pre>
* Eq của module
class Eq a where
    (==) :: a -> a -> Bool
    (/=) :: a -> a -> Bool
    x == y = not (x /= y)
    x /= y = not (x == y)

* Thể hiện của class Eq
* instance khiến kiểu tự định nghĩa trở thành thể hiện của typeclass
data TrafficLight = Red | Green | Yellow 
instance Eq TrafficLight where
    Red == Red = True
    Green == Green = True
    Yellow == Yellow = True
    _ == _ = False


* Thể hiện của Show
instance Show TrafficLight where
    show Red = "Red Light"
    show Yellow = "Yellow light"
    show Green = "Green light"

ghci> Red == Red = True
ghci> Red == Yellow = False
ghci> Red `elem` [Red, Yellow] = True
ghci> [Red, Yellow] = [Red light, Yellow light]    
</pre>

# Yes/ No

- Trong js có thể đặt bất kỳ vào điều kiện luôn trả về bool điều đó được thể hiện qua haskell, ta sẽ áp dụng class, instance
(class định nghĩa typeclass, instance thể hiện class đó)
<pre>
class YesNo a where
   yesno :: a -> Bool

instance YesNo Int where
   yesno 0 = False
   yesno _ = True

instance YesNo [a] where
   yesno [] = False
   yesno _ = True  

instance YesNo Bool where
   yesno = id

instance YesNo (Maybe a) where
   yesno (Just _) = True
   yesno Nothing = False   

instance YesNo TrafficLight where
        yesno Red = False
        yesno _ = True

yesnoIf :: (YesNo y) => y -> a -> a -> a
yesnoIf yesnoVal yesResult noResult = if yesno yesnoVal then yesResult else noResult
ghci> yesnoIf [1,2,3] "This is list" "Not list" = "This is list"
</pre>