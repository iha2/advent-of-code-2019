module ProblemTwo where

import Data.Vector as Vector
import ProblemUtils
import Data.List.Split
import Debug.Trace

intCodeComputer :: [Int] -> Vector.Vector Int -> Vector.Vector Int
intCodeComputer (1:x:y:output:xs) code = intCodeComputer xs $ code // [(output, (code ! x) + (code ! y))]
intCodeComputer (2:x:y:output:xs) code = intCodeComputer xs $ code // [(output, (code ! x) * (code ! y))]
intCodeComputer (99:xs) code = code

createState :: [Int] -> [(Int, Int)] -> [Int]
createState program initialState = toList $ fromList program // initialState 

unwrap :: Maybe [Int] -> [Int]
unwrap Nothing = []
unwrap (Just progam) = progam

generateIntCodeProgramResult :: [Int] -> [(Int, Int)] -> Int 
generateIntCodeProgramResult program initialState = let initialProgam = createState program initialState
                                                     in Vector.head $ intCodeComputer initialProgam $ fromList initialProgam 

splitValue :: Int -> Int -> Int
splitValue placeRepresentation value = value `div` placeRepresentation 

getNoun = splitValue 100

getVerb value = let noun = getNoun value 
                 in value - (noun * 100)

getState value = [(1, getNoun value), (2, getVerb value)]

getMiddle lowEndValue highEndValue = lowEndValue + (highEndValue - lowEndValue) `div` 2

binarySearch :: [Int] -> Int -> Int -> Int -> Int -> Int
binarySearch program valueToFind currentValue stateValue searchSize
  |  valueToFind > result = binarySearch program valueToFind result  (getMiddle stateValue searchSize) searchSize
  |  valueToFind < result = binarySearch program valueToFind result stateValue (getMiddle stateValue searchSize)
  |  otherwise =  middle
    where middle = getMiddle stateValue searchSize
          result = generateIntCodeProgramResult program $ getState middle


main :: IO ()
main = do 
  fileInfo <- readFile "inputs/input-2-2019.txt"
  let program = ProblemUtils.getNumbers fileInfo
  print . generateIntCodeProgramResult (unwrap program) $ [(1, 12), (2,2)]
  print $ binarySearch (unwrap program) 19690720 0 1202 9999
