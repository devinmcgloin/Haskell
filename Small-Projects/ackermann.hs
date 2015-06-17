main :: IO()
main = do
  print $ ackermann 3 13


ackermann :: Int -> Int -> Int
ackermann m n
    | m == 0 = n + 1
    | m > 0 && n == 0 = ackermann (m-1) 1
    | otherwise = ackermann (m-1) $ ackermann m (n-1)
