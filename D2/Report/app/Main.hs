module Main where

main :: IO ()
main = do
    contents <- readFile "input.txt"
    print $ checkReport $ lines contents

checkReport :: [String] -> Int
checkReport [] = 0
checkReport (x:xs)
    | isAsc $ words x = checkReport xs + 1
    | isDesc $ words x = checkReport xs + 1
    | otherwise = checkReport xs

isAsc :: [String] -> Bool
isAsc [] = True
isAsc [_] = True
isAsc (x:y:xs) = 
    let a = readInt x
        b = readInt y
    in (abs (a-b) < 4) && (a < b) && isAsc (y:xs)

isDesc :: [String] -> Bool
isDesc [] = True
isDesc [_] = True
isDesc (x:y:xs) =
    let a = readInt x
        b = readInt y
    in (abs (a-b) < 4) && (a > b) && isDesc (y:xs)


readInt :: String -> Int
readInt = read