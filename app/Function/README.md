# PATTERN MATCHING
![plog](/app/Function/image/3-1.png)
- Chỉ định pattern cho từng case sau đó kiểm tra data theo pattern đã cho
# AS PATTERN
![blog](/app/Function/image/3-2.png)
- Đặt tên biến và dấu @ phía trước pattern để lấy list ban đầu
<pre>
capital :: String -> String
capital "" = "Empty"
capital all@(x:sx) = "the" ++ all ++ " is " ++ [x]
</pre>