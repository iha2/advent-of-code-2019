module Main where

import ProblemOne 

main :: IO ()
main = do 
  fileInfo <- readFile "inputs/input-1-2019.txt"
  print . totalFuel . getModules $ fileInfo
  print . totalMaximumFuel . getModules $ fileInfo
