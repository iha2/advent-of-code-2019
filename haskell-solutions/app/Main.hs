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

parseInt :: String -> Maybe Int
parseInt [] = Nothing
parseInt num = Just $ read num

calculateFuel :: Int -> Int
calculateFuel mass = (round (fromIntegral mass / 3) :: Int) - 2

updateFuel :: Int -> Int -> Int
updateFuel currentFuel totalFuel = totalFuel + calculateFuel currentFuel

totalFuel :: Maybe [Int] -> Int
totalFuel possibleMasses = case possibleMasses of Nothing -> 0
                                                  Just masses -> foldr updateFuel 0 masses

getModules :: String -> Maybe [Int]
getModules = mapM parseInt . lines

main :: IO ()
main = do 
  fileInfo <- readFile "inputs/input-1-2019.txt"
  print . totalFuel . getModules $ fileInfo 
