module Main where

main :: IO ()
main = do
    contents <- readFile "input.txt"
    print $ checkReport $ lines contents

checkReport :: [String] -> Int
checkReport [] = 0
checkReport (x:xs)
    | isSafe levels = 1 + checkReport xs
    | otherwise = checkReport xs
  where levels = map readInt (words x)

isSafe :: [Int] -> Bool
isSafe levels = isAsc levels || isDesc levels || canBeSafe levels

canBeSafe :: [Int] -> Bool
canBeSafe levels = any (\i -> isAsc (removeAt i levels) || isDesc (removeAt i levels)) [0 .. length levels - 1]

isAsc :: [Int] -> Bool
isAsc [] = True
isAsc [_] = True
isAsc (x:y:xs) = (x < y && abs (x - y) < 4) && isAsc (y:xs)

isDesc :: [Int] -> Bool
isDesc [] = True
isDesc [_] = True
isDesc (x:y:xs) = (x > y && abs (x - y) < 4) && isDesc (y:xs)

removeAt :: Int -> [a] -> [a]
removeAt i xs = take i xs ++ drop (i + 1) xs

readInt :: String -> Int
readInt = read
