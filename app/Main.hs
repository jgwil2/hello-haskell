module Main where

import System.IO (readFile)
import Data.Time (getCurrentTime)
import Data.Aeson (encode)

import Lib

main :: IO ()
main = do
    putStrLn (greet "Johnny")
    putStrLn (greet "World")
    printNumbers
    -- printConfig
    print (encode numbers)

numbers = [1,2,3,4] :: [Int]

greet :: String -> String
greet name = "Hello, " ++ name ++ "!"

printNumbers = print (3 + 4)

printConfig = do
    contents <- readFile "stack.yaml"
    putStrLn contents

printTime = do
    time <- getCurrentTime
    print time
