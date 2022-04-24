-- reverse a list

myReverse :: [a] -> [a]
myReverse = foldr (\x y -> y ++ [x]) []

-- interesting solutions:
-- reverse = foldl (flip (:)) []  (from prelude)
-- myReverse = foldl (\a x -> x:a) []  (same idea as mine, should've done this if I thought about it a tiny bit more...)