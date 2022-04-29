-- remove k-th element from list

-- didn't want to use drop, take or splitAt yet again, but this isn't too elegant. Also unsafe, didn't want to bother with that
removeAt :: Int -> [a] -> (a, [a])
removeAt n xs = let r = (map snd $ filter (\t -> fst t /= n) $ zip [1..] xs) in (xs!!(n-1), r)

-- from website:
-- removeAt k xs = case back of
--         [] -> error "removeAt: index too large"
--         x:rest -> (x, front ++ rest)
--   where (front, back) = splitAt (k - 1) xs

-- removeAt n xs | n > 0 && n <= length xs = (Just (xs !! index), take index xs ++ drop n xs)
            --   | otherwise = (Nothing, xs)
            --   where index = n - 1

-- removeAt n xs = ((xs !! (n-1)), [ x | (i, x) <- zip [1..] xs, i /= n ])

-- removeAt 1 (x:xs) = (x, xs)
-- removeAt n (x:xs) = (l, x:r)
-- 	where (l, r) = removeAt (n - 1) xs
