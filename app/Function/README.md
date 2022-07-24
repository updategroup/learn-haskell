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
ghic> [if 5 > 3 then "wo" else "bo", if 'a'>'b' then 'bo' else 'bar'] = ["wo","bar"]
ghic> 4*(let a = 9 in a + 1) + 2 = 42
ghic> [let square x = x * x in (square 5, square 3, square 2)] = (25, 5, 4)]
ghic> (let (a,b,c) = (1,2,3) in a+b+c) * 100 = 300
</pre>
