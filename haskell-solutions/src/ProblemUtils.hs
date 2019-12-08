module ProblemUtils
  (
    parseInt
  , getModules
  , getNumbers
  ) where

import Data.List.Split

parseInt :: String -> Maybe Int
parseInt [] = Nothing
parseInt num = Just $ read num

getModules :: String -> Maybe [Int]
getModules = mapM parseInt . lines


getNumbers :: String -> Maybe [Int]
getNumbers = mapM parseInt . splitOn ","
