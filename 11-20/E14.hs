-- duplicate items in a list

dupli :: [a] -> [a]
dupli = concatMap (\x -> [x, x])

-- interesting solutions from website:
-- dupli xs = xs >>= (\x -> [x,x])
-- dupli = (<**> [id,id])
-- dupli = foldr (\ x xs -> x : x : xs) []