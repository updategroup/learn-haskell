# DATA
- Dùng từ khoá data để định nghĩa phía trước = tên kiểu, sau = là value constructor dùng | để value constructor có những giá trị khác nhau

<pre>
data Shape = Circle Float Float Float | Rectangle Float Float Float Float deriving (Show)
surface :: Shape -> Float
surface (Circle _ _ r) = pi * r ^ 2
ghci> surface $ Circle 10 20 10 = 313
data Point = Point Float Float deriving (Show)
ghci> surface (Circle (Point 0 0) 24) = 10000
</pre>

# RECORD SYNTAX
<pre>
data = Person = Person String String Int deriving (Show)
ghci> let guy = Person "A" "B" 12
ghci> guy = Person "A" "B" 12
firtName :: Person -> String
firtName (Person _ _ ) = firtName
ghci> let guy = Person "A" "B" 12
ghci> firtName guy = "A"
</pre>

# RECORD
<pre>
data Person = Person {
    firtName :: String,
    lastName :: String,
    age :: Int
} deriving (Show)

data Car = Car {
    company :: String,
    model :: String,
    year :: Int
} deriving (Show)

ghci> Car {company= "C", model="M", year = 2000} = Ca {company= "C", model="M", year = 2000} 
</pre>

# TYPE PARAMATER
![](/app/Data/image/9-2.png)

- Type constructor nhận vào tham số là kiểu để tạo ra kểu mới
