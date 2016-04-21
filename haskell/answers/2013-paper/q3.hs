--Part B
data Expr = K Int
            | V String
            | Add Expr Expr
            | Dvd Expr Expr
            | Let String Expr Expr

type Dict = [(String, Int)]
ins :: String -> Int -> Dict -> Dict
ins s i d = ((s, i):d)
lkp :: String -> Dict -> Maybe Int
lkp _ [] = Nothing
lkp key ((tkey,tval):rest) =
    if key == tkey
        then Just tval
        else lkp key rest

eval :: Dict -> Expr -> Maybe Int
eval _ (K i) = Just i
eval d (V s) = lkp s d
eval d (Add e1 e2) = case a of 
        (Just a') -> case b of 
            (Just b') -> Just (a' + b')
            (Nothing) -> Nothing
        (Nothing) -> Nothing
    where (a, b) = (eval d e1, eval d e2)
eval d (Let v e1 e2) = case i of 
       (Just a) -> eval (ins v a d) e2
       Nothing -> Nothing
    where i = eval d e1