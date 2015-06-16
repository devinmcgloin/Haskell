-- You want a main, fine
main :: IO ()
main =  do
  putStrLn "Initializing"
  putStrLn $ palindrome2 "racecar"
  putStrLn $ palindrome2 "isPalindrome"
  print $ palindromeTest ( palindrome2 "racecar" )



{--Write a function that computes the number of elements in a list. To test it, ensure that it gives the same answers as the standard length function. 51 comments
Add a type signature for your function to your source file. To test it, load the source file into ghci again. 8 comments--}
len :: [a] -> Int
len [] = 0
len xs = 1 + len (tail xs)

{--Write a function that computes the mean of a list, i.e. the sum of all elements in the list divided by its length. (You may need to use the fromIntegral function to convert the length of the list from an integer into a floating point number.) 74 comments--}

custMean xs = sum xs / fromIntegral (len xs)

{--Turn a list into a palindrome, i.e. it should read the same both backwards and forwards. For example, given the list [1,2,3], your function should return [1,2,3,3,2,1]. 72 comments--}

palindrome2 :: [a] -> [a]
palindrome2 []     = []
palindrome2 (x:xs) = [x] ++ palindrome2 xs ++ [x]

{-- Write a function that determines whether its input list is a palindrome. 85 comments --}
palindromeTest :: (Eq a) =>[a] -> Bool
palindromeTest []     = True
palindromeTest (x:xs) = x == last xs && palindromeTest (init xs)

-- Someones Elses Answer
isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome []       = False
isPalindrome (x:[])   = True
isPalindrome (x:y:[]) = x == y
isPalindrome (x:xs)   = x == last xs && isPalindrome (init xs)

{-- Create a function that sorts a list of lists based on the length of each sublist. (You may want to look at the sortBy function from the Data.List module.) 43 comments --}

--Based on haskell great good quicksort.
sortBySublist :: [[a]] -> [[a]]
sortBySublist []      = []
sortBySublist (x:xs)  =
    let smallerSorted = sortBySublist [a | a <- xs, length a <= length x]
        biggerSorted  = sortBySublist [a | a <- xs, length a > length x]
    in  smallerSorted ++ [x] ++ biggerSorted


{--Define a function that joins a list of lists together using a separator value. 25 comments--}

intersperse :: t -> [[t]] -> [t]
intersperse _ []     = []
intersperse _ (x:[]) = x
intersperse sep (x:xs) = x ++ [sep] ++ intersperse sep xs

--Someone elses answer
intersperse1 :: a -> [[a]] -> [a]
intersperse1 _ []    = []
intersperse1 _ (x:[]) = x
intersperse1 sep (x:xs) = x ++ [sep] ++ intersperse1 sep xs

{--Using the binary tree type that we defined earlier in this chapter, write a function that will determine the height of the tree. The height is the largest number of hops from the root to an Empty. For example, the tree Empty has height zero; Node "x" Empty Empty has height one; Node "x" Empty (Node "y" Empty Empty) has height two; and so on. 34 comments--}

data Tree a = Node a (Tree a) (Tree a)
            | Empty
              deriving (Show)

simpleTree = Node "parent" (Node "left child" Empty Empty)
                           (Node "right child" Empty Empty)

-- depth :: Tree -> Int
depth Empty = 0
depth (Node a b c) = 1 + max (depth b) (depth c)

{--Consider three two-dimensional points a, b, and c. If we look at the angle formed by the line segment from a to b and the line segment from b to c, it either turns left, turns right, or forms a straight line. Define a Direction data type that lets you represent these possibilities. 24 comments--}

data Direction = Strait | Left | Right
      deriving (Show)

data Point2D = Cartesian2D {
	  x :: Double
	, y :: Double
	} deriving (Eq, Show)

{-- Write a function that calculates the turn made by three 2D points and returns a Direction. 58 comments --}

{-- Define a function that takes a list of 2D points and computes the direction of each successive triple. Given a list of points [a,b,c,d,e], it should begin by computing the turn made by [a,b,c], then the turn made by [b,c,d], then [c,d,e]. Your function should return a list of Direction. 19 comments --}

{--Using the code from the preceding three exercises, implement Graham's scan algorithm for the convex hull of a set of 2D points. You can find good description of what a convex hull. is, and how the Graham scan algorithm should work, on Wikipedia. 63 comments --}
