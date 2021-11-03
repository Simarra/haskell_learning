
take' :: (Num i, Ord i) => i -> [a] -> [a]
take' n _
  | n <= 0 = []
take' _ [] = []
take' n (x:xs) = x : take' (n-1) xs

main = do print $ take' 3 [1,2,3,4,5,6]
	  print $ take' 3 ["coucou", "le", "super", "monde"]
