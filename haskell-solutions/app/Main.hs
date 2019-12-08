module Main where

import ProblemUtils 
import ProblemOne 

main :: IO ()
main = do 
  fileInfo <- readFile "inputs/input-1-2019.txt"
  print . totalFuel . ProblemOne.getModules $ fileInfo
  print . totalMaximumFuel . ProblemOne.getModules $ fileInfo
