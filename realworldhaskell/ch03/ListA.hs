data List a = Cons a (List a)
            | Nil
              deriving (Show)

fromList (x:xs) = Cons x (fromList xs)
fromList []     = Nil


toList (Cons x xs) = x : (toList xs)
toList Nil	       = []


--Binary Tree in Haskell
data Tree a = Node a (Tree a) (Tree a)
            | Empty
              deriving (Show)

--Binary Tree with only one constructor 
--data Tree a = Node a (Maybe (Tree a)) (Maybe (Tree a))
--			 deriving (Show)