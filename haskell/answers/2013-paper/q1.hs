-- 2013 - Question 1
-- (a)
my_null :: [a] -> Bool
my_null [] = True
my_null _ = False

-- (b)
(+++) :: [a] -> [a] -> [a]
(+++) [] ys = ys
(+++) (x:xs) ys = x : (+++) xs ys

-- (c)
my_last :: [a] -> a
my_last [x] = x
my_last (x:xs) = my_last xs

-- (d)
my_dropWhile :: (a -> Bool) -> [a] -> [a]
my_dropWhile _ [] = []
my_dropWhile f (x:xs)
  | f x = my_dropWhile f xs
  | otherwise = x:xs

-- (e)
my_filter :: (a -> Bool) -> [a] -> [a]
my_filter _ [] = []
my_filter f (x:xs)
  | f x = x:ts
  | otherwise = ts
  where ts = my_filter f xs

-- (f)
my_foldr1 :: (a -> a -> a) -> [a] -> a
my_foldr1 _ [x] = x
my_foldr1 op (x:xs) = x `op` my_foldr1 op xs
