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
Sau where định nghĩa các biến và hàm, các biến này có hiệu lực cho tất cả các guard
# LET IN
![plog](/app/Function/image/3-5.png)
