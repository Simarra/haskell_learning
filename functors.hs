mul2 :: (Num a) => a -> a
mul2 x = x *2

-- Le foncteur est une sorte de wrapper, surtype.
-- par exemple l'objet liste qui encapsule des sous valeurs, Maybe qui encapsule des sous valeurs..
fmul2 :: (Num a, Functor f) => f a -> f a
fmul2 x = fmap (\y -> y * 2) x

main = do
    print $ fmul2 $ Just 4
