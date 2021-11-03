-- if we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.

--Find the sum of all the multiples of 3 or 5 below 1000.


modulo :: Int -> Int -> Bool
modulo x y = if y `rem` x == 0
                       then True
		    else False

-- Closure system
modulo_by x  = (\y -> modulo x y)
modulo_by_3 = modulo_by 3
modulo_by_5 = modulo_by 5

main = do
	let the_list =  filter (\x -> modulo_by_3 x &&  modulo_by_5 x) [1..100]
	print(the_list)
	print("the sum is : ")
	print(sum the_list)

        print("this one liner is by far more elegant")
        print(sum (filter (\x -> x `mod` 5 == 0 && x `mod` 3==0) [1..100]))
