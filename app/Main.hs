module Main where
import Curry.Demo as CurryDemo
import Function.Demo as FunctionDemo

main :: IO ()
main = do

    putStrLn("--------------------Start Curry-----------------------")
    print(CurryDemo.multThree 1 2 3)

    print(CurryDemo.compareWithHundred 3)

    print(CurryDemo.divideByTen 100)

    print(CurryDemo.isUpperAlphanum 'a')

    print(CurryDemo.applyTwice (subtract 3) 10)
    print(CurryDemo.applyTwice (+3) 10)
    print(CurryDemo.applyTwice (++ " HAHA") "HEY")
    print(CurryDemo.applyTwice ("HAHA " ++) "HEY")
    print(CurryDemo.applyTwice (CurryDemo.multThree 2 2) 9)
    print(CurryDemo.applyTwice (3:) [1])

    print(CurryDemo.zipWithD (+) [1,2,3] [1,2,1,4])
    print(CurryDemo.zipWithD max [3,8,3] [1,2,9])
    print(CurryDemo.zipWithD (++) ["tran ", "love "] ["quoc", "you"])
    print(CurryDemo.zipWithD (*) (replicate 5 2) [1..])

    print(CurryDemo.flipD zip [1,2,3] "tranquoc")
    print(CurryDemo.zipWithD (flipD div) [2,2..] [10,8,6,4])

    print(CurryDemo.mapD (+3) [1,5,3])
    print(CurryDemo.mapD (++ "!") ["BIG","DOW"])
    print(CurryDemo.mapD (replicate 3) [1..4])
    print(CurryDemo.mapD (map (^2)) [[1,2], [3,4,5,6], [7, 8]])
    print(CurryDemo.mapD fst [(1,2), (3,5), (7,9)])
    -- print(CurryDemo.largestDivisible)
    print(CurryDemo.chain 3)
    print(CurryDemo.numLongChains)


    putStrLn("--------------------End Curry-------------------------")

    putStrLn("--------------------Start Function--------------------")
    print(FunctionDemo.lucky 7)
    print(FunctionDemo.factorial 4)
    print(FunctionDemo.headD [1,2,3])
    print(FunctionDemo.lengthD [1,2,3])
    print(FunctionDemo.sumD [1,2,3])
    print(FunctionDemo.capital "Dracula")
    print(FunctionDemo.bmiTell 70 1.9)
    print(FunctionDemo.maxD 1 3)
    print(FunctionDemo.bmiTellW 50 1.57)
    print(FunctionDemo.initials "tran" "quoc")
    print(FunctionDemo.cylinder 3 14)
    print(FunctionDemo.headC [1,2])
    print(FunctionDemo.describeList [1,2,3])
    print(FunctionDemo.sumL [3,5,2,1])
