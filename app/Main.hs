module Main where
import Curry.CurryDemo as CurryDemo
import Function_.FunctionDemo as FunctionDemo

main :: IO ()
main = do
    putStrLn("--------------------------------")
    putStrLn("Start Curry")
    print(CurryDemo.multThree 1 2 3)
    putStrLn("End Curry")

-- let multTwoWithNine = CurryDemo.multThree 9