-- Replicate an element n a list


replicator :: (Num i, Ord i) => i -> a -> [a]
replicator n x
  | n <= 0 = []
  | otherwise = x:replicator (n - 1) x

main = do print $ replicator 5 5
