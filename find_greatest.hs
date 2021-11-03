-- Find the greatest element of a list


find_greatest :: (Ord a) => [a] -> a
find_greatest [] = error "Empty list"
find_greatest [x] = x
find_greatest (x:xs)
  | x > list_max = x
  | otherwise = list_max
  where list_max = find_greatest xs

main = do print $ find_greatest [9, 10] 
          print $ find_greatest ["a", "b"]
