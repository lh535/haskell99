-- find last but one element of list

myButLast :: [a] -> a
myButLast [] = error "list too short"
myButLast [x] = error "list too short"
myButLast (x:xs) | length xs == 1 = x
myButLast (x:xs) = myButLast xs


-- solutions I found clever:
-- myButLast = last . init
-- myButLast = fst . foldl (\(a, b), x -> (b, x)) (error "empty", error "too short")