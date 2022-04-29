-- drop every n-th element from a list

dropEvery :: [a] -> Int -> [a]
dropEvery = f 1
    where f i (x:xs) n = if i == n then f 1 xs n else x : f (i + 1) xs n
          f _ [] _     = []

-- website solutions:
-- dropEvery :: [a] -> Int -> [a]
-- dropEvery [] _ = []
-- dropEvery list count = (take (count-1) list) ++ dropEvery (drop count list) count

-- dropEvery = flip $ \n -> map snd . filter ((n/=) . fst) . zip (cycle [1..n])

-- dropEvery xs n = [ i | (i,c) <- ( zip xs [1,2..]), (mod c n) /= 0]