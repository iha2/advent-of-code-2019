

module ProblemOne
( 
  totalFuel
, getModules
, totalMaximumFuel
) where

parseInt :: String -> Maybe Int
parseInt [] = Nothing
parseInt num = Just $ read num

calculateFuel :: Int -> Int
calculateFuel mass = (floor (fromIntegral mass / 3) :: Int) - 2

updateFuel :: Int -> Int -> Int
updateFuel currentFuel totalFuel = totalFuel + calculateFuel currentFuel

totalFuel :: Maybe [Int] -> Int
totalFuel Nothing = 0
totalFuel (Just masses) = foldr updateFuel 0 masses

getModules :: String -> Maybe [Int]
getModules = mapM parseInt . lines

-- PART 2

updateMaximumFuel :: Int -> Int -> Int
updateMaximumFuel fuel maxFuel 
  |  updatedFuel < 0 = maxFuel
  |  otherwise  = updateMaximumFuel updatedFuel $ maxFuel + updatedFuel
    where updatedFuel = calculateFuel fuel

totalMaximumFuel :: Maybe [Int] -> Int
totalMaximumFuel Nothing = 0
totalMaximumFuel (Just masses) = foldr updateMaximumFuel 0 masses


main :: IO ()
main = do 
  fileInfo <- readFile "inputs/input-1-2019.txt"
  print . totalFuel . getModules $ fileInfo
  print . totalMaximumFuel . getModules $ fileInfo


