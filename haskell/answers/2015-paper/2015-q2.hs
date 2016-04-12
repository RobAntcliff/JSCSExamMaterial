hof :: (a -> b -> c) -> [a] -> [b] -> [c]
hof f (x:[]) (y:[]) = f x y : []
hof f (x:xs) (y:ys) = f x y : hof f xs ys

f1 :: (Num a) => [a] -> [a] -> [a]
f1 a b = hof (*) a b 

f2 :: (Num a) => [a] -> [a] -> [a]
f2 a b = hof (+) a b 

f3 :: [a] -> [b] -> [(a,b)]
f3 a b = hof (,) a b

f4 :: [b] -> [a] -> [(a,b)]
f4 a b = hof (,) b a


-- Stupid function, does nothing worthwhile
f5 :: [a] -> [a] -> [a]
f5 a b = hof (\x _ -> x) a b


-- In the prelude, hof is zipWith
