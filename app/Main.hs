module Main where

import System.IO
import Data.Time

import Lib

main :: IO ()
main = do
    putStrLn (greet "Johnny")
    putStrLn (greet "World")
    printNumbers
    printConfig

greet :: String -> String
greet name = "Hello, " ++ name ++ "!"

printNumbers = print (3 + 4)

printConfig = do
    contents <- readFile "stack.yaml"
    putStrLn contents

printTime = do
    time <- getCurrentTime
    print time
