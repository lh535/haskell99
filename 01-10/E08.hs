-- eliminate consecutive duplicates in list

compress :: Eq a => [a] -> [a]
compress [] = []
compress (x:xs) = reverse $ compress' x xs []
    where compress' cur (x:xs) res = if cur == x then compress' x xs res else compress' x xs (cur:res)
          compress' cur [] res = cur:res

-- my own alternative:
compress2 :: Eq a => [a] -> [a]
compress2 xs = foldr (\(x, y) acc -> if x == y then acc else x:acc) [] (zip xs $ tail xs) ++ [last xs]


----------------- interesting solutions from website: -----------------------

-- compress a = [ fst x | x <- consecutivePairs a, (fst x /= snd x) ] ++ [last a]  (same idea, just didn't know about [_ | _ <- _])

-- (inefficient):
-- compress :: (Eq a) => [a] -> [a]
-- compress = foldr skipDups []
--     where skipDups x [] = [x]
--           skipDups x acc
--                 | x == head acc = acc
--                 | otherwise = x : acc

-- compress = map head . group  -- (from Data.List.group)

--compress (x:ys@(y:_))
--     | x == y    = compress ys
--     | otherwise = x : compress ys
-- compress ys = ys 

-- Maybe gets optimized away by ghc. Tbh this was horrible to visualize. Note that Nothing is technically inserted for function call
-- for first element, because of foldr f a x:xs = f x (foldr f a xs) extra_arg
-- const [] gets resolved at the very end
-- compress xs = foldr f (const []) xs Nothing 
--   where
--     f x r a@(Just q) | x == q = r a
--     f x r _ = x : r (Just x)

-- compress []     = []
-- compress (x:xs) = x : (compress $ dropWhile (== x) xs)