module ProblemTwo where

import Data.Vector
import ProblemUtils
import Data.List.Split


intCodeComputer :: [Int] -> Vector Int -> Vector Int
intCodeComputer (1:x:y:output:xs) code = intCodeComputer xs $ code // [(output, (code ! x) + (code ! y))]
intCodeComputer (2:x:y:output:xs) code = intCodeComputer xs $ code // [(output, (code ! x) * (code ! y))]
intCodeComputer (99:xs) code = code

state1202 :: Maybe [Int] -> [Int]
state1202 Nothing = [2]
state1202 (Just code) = toList $ fromList code // [(1,12), (2,2)]

main :: IO ()
main = do 
  fileInfo <- readFile "inputs/input-2-2019.txt"
  let code = state1202 . ProblemUtils.getNumbers $ fileInfo
  print . intCodeComputer code $ fromList code
