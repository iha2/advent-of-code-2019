{-# LANGUAGE OverloadedStrings #-}
module Main where

import Lib
import Data.Map (Map)
import qualified Data.Map as Map
import Data.Char

updateDataSet :: (Num a, Ord k) => k -> a -> Map k a -> Map k a
updateDataSet = Map.insert 

convertLinesToNumbers :: [String] -> [Int]
convertLinesToNumbers = map (read::String -> Int)

readInt :: String -> Int
readInt = read

main :: IO ()
main = do 
  fileInfo <- readFile "inputs/input-1-2018.txt"
  print . map readInt . lines $ fileInfo 
