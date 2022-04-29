-- replicate elements in list a given number of times

repli :: [a] -> Int -> [a]
repli xs n = concatMap (replicate n) xs

-- solutions from site:
-- repli = flip $ concatMap . replicate  -- point-free
-- repli xs n = concatMap (take n . repeat) xs
-- repli xs n = xs >>= replicate n

-- repli [] _ = []
-- repli (x:xs) n = foldr (const (x:)) (repli xs n) [1..n]