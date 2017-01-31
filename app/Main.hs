{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DeriveGeneric #-}

module Main where

import GHC.Generics
import System.IO (readFile)
import System.Environment (getArgs)
import Data.Monoid ((<>))
import Control.Monad (replicateM_)
import Data.Time (getCurrentTime)
import Data.Aeson (encode, FromJSON, ToJSON)
import Web.Scotty

import Lib

main :: IO ()
main = do
    putStrLn "Starting server"
    scotty 3000 $ do
        get "/hello/:name" $ do
            name <- param "name"
            text ("Hello, " <> name <> "!")
        get "/users" $ do
            json allUsers
        get "/users/:id" $ do
            id <- param "id"
            json $ head $ filter (matchesId id) allUsers

data User = User { userId :: Int, userName :: String } deriving (Show, Generic)
instance ToJSON User
instance FromJSON User

bob = User { userId = 1, userName = "bob" }
jen = User { userId = 2, userName = "jen" }

allUsers = [bob, jen]

matchesId id user = userId user == id

cat :: IO ()
cat = do
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
