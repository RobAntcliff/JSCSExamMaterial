--- 2015 paper Q1 
--- funcs prepended with 'my_' to avoid collision with the actual prelude funcs 

my_repeat :: a -> [a]
my_repeat x = x:my_repeat x


my_replicate :: Int -> a -> [a]
my_replicate 0 _ = []
my_replicate 1 y = [y]
my_replicate x y = y:my_replicate (x-1) y


my_concat :: [[a]] -> [a]
my_concat [] = []
my_concat [[a]] = [a]
my_concat ([a]:as) = a : my_concat as


my_zip :: [a] -> [b] -> [(a,b)]
my_zip [] [] = []
my_zip [] (a:as) = error "Lists are not same size"
my_zip (a:as) [] = error "Lists are not same size"
my_zip [a] [b] = [(a,b)]
my_zip (a:as) (b:bs) = (a,b) : my_zip as bs


my_unzip :: [(a,b)] -> ([a], [b])
my_unzip [] = ([], [])
my_unzip [(x,y)] = ([x],[y])
my_unzip ((x,y):qs) = (x:xs, y:ys)
                    where
                    (xs,ys) = my_unzip(qs)


my_minimum :: (Ord a) => [a] -> a
my_minimum [] = error "can't get minimum of empty list"  
my_minimum [a] = a
my_minimum (a:as)
    | a>b = b
    | otherwise = a
    where b = my_minimum as


