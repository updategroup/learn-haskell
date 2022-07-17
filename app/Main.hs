module Main where
import Curry.CurryDemo as CurryDemo
import Function_.FunctionDemo as FunctionDemo

main :: IO ()
main = do
    putStrLn("----------------------------------------")
    putStrLn("Start Curry")
    print(CurryDemo.multThree 1 2 3)

    print(CurryDemo.compareWithHundred 3)
    print(CurryDemo.divideByTen 100)
    print(CurryDemo.isUpperAlphanum 'a')
    print(CurryDemo.applyTwice ((-3)) 10)
    putStrLn("End Curry")

