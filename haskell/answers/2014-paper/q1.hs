-- 2014 - Question 1
-- (a)
my_tail :: [a] -> [a]
my_tail [] = error "list must not be empty"
my_tail (x:xs) = xs

-- (b)
(+++) :: [a] -> [a] -> [a]
(+++) [] ys = ys
(+++) (x:xs) ys = x : (+++) xs ys

-- (c)
my_init :: [a] -> [a]
my_init [] = error "list must not be empty"
my_init [x] = []
my_init (x:xs) = x: init xs

-- (d)
my_break :: (a -> Bool) -> [a] -> ([a],[a])
my_break _ [] = ([],[])
my_break f (x:xs)
  | f x = ( [] , x:xs )
  | otherwise = ( x:fs , ts )
    where (fs,ts) = my_break f xs

-- (e)
my_reverse :: [a] -> [a]
my_reverse [] = []
my_reverse [x] = [x]
my_reverse (x:xs) = my_reverse xs +++ [x]

-- (f)
my_maximum :: (Ord a) => [a] -> a
my_maximum [] = error "list must not be empty"
my_maximum [a] = a
my_maximum (a:as)
  | a>b = a
  | otherwise = b
  where b = my_maximum as
