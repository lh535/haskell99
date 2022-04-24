-- find length of lists

myLength :: [a] -> Integer
myLength = foldr (\x y -> y+1) 0

-- interesting solutions:
-- myLength = foldr (const (+1)) 0
-- myLength = fst . last . zip [1..]