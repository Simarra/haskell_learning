data Cell = Living | Dead
data Grid = [[Cell]]

generateEmptyGrid :: Int -> Int -> Grid
generateEmptyGrid x y = [z | z <- Dead]
-- grid n = [(x, y)| x<- [0..n], y<-[0..n]]

