-- find the last element of a list

myLast :: [a] -> a
myLast [] = error "can't get last element for empty list"
myLast [x] = x
myLast (x:xs) = myLast xs


-- solutions I found clever:
-- myLast = foldr1 (const id)
-- myLast = foldl (curry snd)