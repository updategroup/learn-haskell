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

<pre>
data BookInfo = Book Int String [String]
                deriving (Show)
- BookInfo tên kiểu mới, hay là phương thức tạo kiểu
- Book là phương thức tạo giá trị(phươ thức tạo dữ liệu), tạo một giá trị của kiểu BookInfo   
myInfo=Book 98 "A" ["A","B"]
ghci> myInfo=Book 98 ..
ghci>:t myInfo=myInfo::BookInfo      

type CustomerID=Int
type ReviewBody=String
data BetterReview=BetterReview BookInfo CustomerID ReviewBody
type BookRecord =(BookInfo, BookReview)

type CardHolder=String
type CardNumber=String
type Address = [String]
data BillingInfo = CreditCard CardNumber CardHolder Address
                    | CashOnDelivery
                    | Invoice CustomerID
                    deriving (Show)

bookID (Book id title authors) = id
bookTitle (Book id tilte authors) = title
bookAuthors (Book id title authors) = authors
ghci> bookID (Book 3 "P" ["A","B"])=3
ghci>:t bookID=bookID::BookInfo->Int
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

<pre>
data Maybe a = Nothing | Just a

data Car a b c = Car {
    company :: a,
    model :: b,
    year ::c
} deriving (Show)

tellCar: Car -> String
tellCar (Car {company = c, model = b, year = c}) = "This " ++ a ++ " " ++ b ++ "in " ++ show c
ghci> let tang = Car {company = "F", model="M", year=2000}
ghci> tellCar tang 
</pre>

<pre>
data Person = Person {
    firtName :: String,
    lastName :: String,
    age :: Int
} deriving (Eq, Show, Read)
ghci> let c = Person {firtName="m",lastName="L",age=12}
ghci> "object is tring" ++ show c
ghci> read c::Person
</pre>

- typeclass Bounded (kiểu có biên trên và biên dưới)
<pre>
data Day =  Monday | Tuesday | Wednesday | Thursday | Friday | Saturday | Sunday deriving (Eq, Ord, Show, Read, Bounded, Enum)
ghci> Wednesday
ghci> show Wednesday = "Wednesday"
ghci> read "Wednesday"::Day
ghci> Wednesday == Sunday
ghci> Wednesday > Sunday
ghci> minBound :: Day = Monday
ghci> maxBound :: Day = Sunday
ghci> succ Monday = Tuesday
ghci> pred Saturday = Friday
ghci> [Monday .. Sunday] = [Monday,Tues.....]
</pre>

<pre>
type String = [Char]
(type: Đồng kiểu)
</pre>
<pre>
data Either a b = Left a | Right b deriving (Eq, Ord, Show, Read)
</pre>
- Có 2 constructor value. Nếu Left được dùng thì nội dung thuộc kiểu a và ngược lại
- Dùng either gói 2 giá trị có 2 kiểu khác nhau sau đó dùng pattern matching với cả Left lẫn Right

