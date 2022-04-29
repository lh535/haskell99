-- split list into two. Length of first part is given. Don't use predefined predicates

-- solution with predefined predicates:
split :: [a] -> Int -> ([a], [a])
split xs n = (take n xs, drop n xs)  -- VS Code suggests splitat, that seems like it'd be kinda cheating in this case

-- alternative:
split' :: [a] -> Int -> ([a], [a])
split' [] _ = ([], [])
split' xs 0 = ([], xs)
split' (x:xs) n = let (l1, l2) = split' xs (n-1) in (x : l1, l2)

-- solutions from website:
-- split = flip splitAt

-- split :: [a] -> Int -> ([a], [a])
-- split xs n = let (a, b) = helper [] xs n in (reverse a, b)
--   where helper left right@(r:rs) n
--          | n == 0    = (left, right)
--          | otherwise = helper (r:left) rs (n - 1)