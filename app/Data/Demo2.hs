import Data.Map (Map)

data Bool = False | True
-- data Int = -214 | -214 | ...  -1 | 0 | 1 | 2 | ... | 214
data Shape = Circle Float Float Float | Rectangle Float Float Float Float deriving (Show)

area :: Shape -> Float
area (Circle _ _ r) = r * 3.14

toList = map (Circle 1 2) [3,4]

data Point = Point Float Float deriving (Show)
data Shape1 = Circle1 Point Float | Rectangle1 Point Point deriving (Show)

area1 :: Shape1 -> Float
area1 (Circle1 _ r) = 3.14
area1 (Rectangle1 (Point x1 y1) (Point x2 y2)) = (abs $ x2 - x1) * (abs $ y2 - y1)

nudge :: Shape1 -> Float -> Float -> Shape1
nudge (Circle1 (Point x y) r) a b = Circle1 (Point (x+a) (y+b)) r
nudge (Rectangle1 (Point x1 y1) (Point x2 y2)) a b = Rectangle1 (Point (x1 + a) (y1 + b)) (Point (x2 + a) (y2 + b))