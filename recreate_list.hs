-- Ceci est un constructeur de type. 
-- -- si on fait :info sur List, on voit que cela renvoie
-- Mist :: * -> *
-- Si on fait :info List Int, alors on a un type concret
-- List Int :: *

data List a 
    = Nil
    | Cons a (List a)
    -- deriving (Show)

concatList :: List a -> List a -> List a
concatList (Cons x xs) ys = Cons x (concatList xs ys)
concatList Nil ys = ys


instance Show a => Show (List a) where -- contrainte de show sur list polypmorphe
    show Nil          = "]"
    show (Cons x Nil) = show x ++ "]"
    show (Cons x xs)  = show x ++ ", "  ++ show xs

-- Create a functor for the list
instance Functor List where
    -- fmap :: (a -> b) -> List a -> List b
    fmap f Nil         = Nil
    fmap f (Cons x xs) = Cons (f x)  (fmap f xs)

-- Create an applicative for using multi args and
-- <*> notation.
instance Applicative List where
    --  pure :: a -> f a
    --  pure :: a -> List a
    --  (<*>) :: f (a -> b) -> f a -> f b
    --  (<*>) :: List (a -> b) -> List a -> List b
    pure x = Cons x Nil
    -- for <*>: 1st item is a list of functions, second a list of elts.
    -- The fmapping will generate multiple results.
    -- So at the end we need to concat them.
    (Cons f fs) <*> xs = 
        let ys = fs <*> xs
        in concatList (f <$> xs) ys
    Nil <*> xs = Nil

instance Monad List where
    -- (>>=) :: m a -> (a -> m b) -> m b
    -- (>>=) :: List a -> (a -> List b) -> List b
    (Cons x xs) >>= f =
        concatList (f x ) (xs >>= f)
    Nil >>= _ = Nil



main = do
    print (Cons 1 (Cons 2 Nil))
    print $ fmap (*2) (Cons 1 (Cons 2 Nil))
    print $  (*2) <$> (Cons 1 (Cons 2 Nil))
    print $  (*) <$> (Cons 1 (Cons 2 Nil)) <*> (Cons 1 (Cons 2 Nil))
    pdsd

    -- Monad
    print $ Cons 1 (Cons 2 Nil) >>= \x -> Cons 3 (Cons 2 Nil) >>= \y -> return (x*y)
