
- Haskell cũng có hiệu ứng phụ nhưng với việc trao đổi thông tin với bàn phím, màn hình
- Một hành động IO sẽ được thực hiện khi ta đăt tên cho nó là main và sau đó chạy chương trình
- do Dùng để kết hợp nhiều hành động I/O thành một

<pre>
ghc --make Demo1
./Demo1
</pre>
<pre>
import Data.Char

main = do
    putStrLn "What's your first name?"
    firstName <- getLine
    putStrLn "What's your last name?"
    lastName <- getLine
    let bigFirstName = map toUpper firstName
        bigLastName = map toUpper lastName
    putStrLn $ "hey " ++ bigFirstName ++ " " ++ bigLastName ++ ", how are you?"
</pre>

<pre>
import Data.Char
main = do
    line <- getLine
    if null line
        then return ()
    else do
        putStrLn $ reserseWords line
        main

reserseWords :: String -> String
reserseWords = unwords . map reverse . words
</pre>

Việc dùng return không kết thúc việc thực thi khối do I/O
<pre>
main = do
    return ()
    return "HAHAHA"
    line <- getLine
    return "BLAH BLAH BLAH"
    return 4
    putStrLn line
</pre>
- When thực hiện một Bool và một hành động I/O. Nếu True nó sẽ trả về hành động IO, False sẽ trả về hành động return () không làm gì cả
- Ham when sẽ gọn hơn if
<pre>
main = do
    c <- getChar
    if  c /= ' '
        then do
            putChar c
            main
    else return ()    



import Control.Monad
main = do
    c <- getChar
    when (c /= ' ') $ do
        putChar c
        main  
</pre>

sequence nhận vào một danh sách những thao tác I/O rồi trả lại một thao tác I/O nhằm thực hiện lần lượt các thao tác đó.
<pre>
main = do
    a <- getLine
    b <- getLine
    c <- getLine
    print [a,b,c]
 
main = do
    rs <- sequence [getLine, getLine, getLine]
    print rs    
</pre>

forever nhận vào một thao tác I/O rồi trả về một thao tác I/O chỉ bằng cách lặp lại vĩnh viễn thao tác I/O đó. Hàm này nằm trong Control.Monad. 
<pre>
import Control.Monad
import Data.Char

main = forever $ do
    putStr "Give me some input: "
    l <- getLine
    putStrLn $ map toUpper l
</pre>

<pre>
import Control.Monad

main = do 
    colors <- forM [1,2,3,4] (\a -> do
        putStrLn $ "Which color do you associate with the number " ++ show a ++ "?"
        color <- getLine
        return color)
    putStrLn "The colors that you associate with 1, 2, 3 and 4 are: "
    mapM putStrLn colors
</pre>

# FILE

- getContents là một thao tác I/O nhằm đọc vào mọi thứ tự thiết bị đầu vào chuẩn đến khi nó bắt gặp một kí tự kết thúc tập tin. 
- getContents thực hiện IO một cách lười biếng
<pre>
import Control.Monad
import Data.Char

main = forever $ do
    putStr "Give me some input: "
    l <- getLine
    putStrLn $ map toUpper l


import Data.Char

main = do
    contents <- getContents
    putStr (map toUpper contents)
</pre>

- interact nhận vào một hàm kiểu String -> String làm tham số rồi trả về một thao tác IO để nhận dữ liệu đầu vào, chạy một hàm trên dữ liệu đó rồi in kết quả

<pre>
main = interact shortLinesOnly
</pre>

<pre>
handle <- openFile "path" ReadMode

openFile :: FilePath -> IOMode -> IOHandle

type FilePath = String
data IOMode = ReadMode | WriteMode | AppendMode | ReadWriteMode
</pre>



# EXCEPTION

<pre>
import System.Environment
import System.IO
import System.IO.Error

main = toTry `catch` handler

toTry :: IO ()
toTry = do (fileName:_) <- getArgs
           contents <- readFile fileName
           putStrLn $ "The file has " ++ show (length (lines contents)) ++ " lines!"

handler :: IOError -> IO ()
handler e = putStrLn "Whoops, had some trouble!"
</pre>



