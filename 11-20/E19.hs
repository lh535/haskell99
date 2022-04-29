-- rotate a list n places to the left (put first n items at the end. Negative Numbers allowed)
-- hint from site: use ++ and length

rotate :: [a] -> Int -> [a]
rotate xs n | n < 0 = let l = length xs in drop (l + n) xs ++ take (l + n) xs
rotate xs 0         = xs
rotate xs n | n > 0 = drop n xs ++ take n xs

-- website solutions:
-- rotate xs n = take len . drop (n `mod` len) . cycle $ xs
--     where len = length xs

-- rotate xs n = let i = if n < 0 then length xs + n else n
--               in drop i xs ++ take i xs

-- rotate xs n
--     | n < 0 = rotate xs (n+len)
--     | n > len = rotate xs (n-len)
--     | otherwise = let (f,s) = splitAt n xs in s ++ f
--     where len = length xs