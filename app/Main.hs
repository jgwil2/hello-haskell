module Main where

import System.IO (readFile)
import Data.Time (getCurrentTime)
import Data.Aeson (encode)
import System.Environment (getArgs)
import Control.Monad (replicateM_)

import Lib

main :: IO ()
main = do
    file <- fmap head getArgs >>= readFile
    putStrLn file

printMessage :: IO()
printMessage = do
    args <- getArgs
    let message = head args
    let n = read (last args) :: Int
    replicateM_ n (print message)

numbers = [1,2,3,4] :: [Int]
numbersJson = encode numbers

greet :: String -> String
greet name = "Hello, " ++ name ++ "!"

printNumbers = print (3 + 4)

printConfig = do
    contents <- readFile "stack.yaml"
    putStrLn contents

printTime = do
    time <- getCurrentTime
    print time
