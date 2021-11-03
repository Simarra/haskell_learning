import Control.Monad.ST
import System.Random.MWC

mul2:: Int -> ST s Int
mul2 x = return (x*2)

add1:: Int -> Int
add1 x = x + 1

randMul2add1 :: GenST s -> ST s Int
randMul2add1 gen = do
        res <- uniformR (1,100) gen
	return res

main:: IO()
main = do
    stToIO mul2 9-- >>= add1
