-- extract slice from list, with two indeces i and k (starts counting at 1)

slice :: [a] -> Int -> Int -> [a]
slice xs i k = take (k - i + 1) $ drop (i -1) xs

-- solutions from site:
-- paranoid solution:
-- slice :: [a] -> Int -> Int -> Maybe [a]
-- slice [] _ _ = Just []
-- slice xs k n 	| k == n = Just []
-- 		            | k > n || k > length xs || n > length xs || k < 0 || n < 0 = Nothing
-- 		            | k == 0 = Just (take n xs)
-- 		            | otherwise = Just (drop (k-1) $ take n xs)

-- slice xs i k = [x | (x,j) <- zip xs [1..k], i <= j]

-- slice xs a b = fst $ unzip $ filter ((>=a) . snd) $ zip xs [1..b]