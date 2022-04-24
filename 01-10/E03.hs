-- find k-th element

elementAt :: [a] -> Integer -> a
elementAt [] _ = error "invalid index"  -- note that I realised after looking at solutions: this doesn't trigger for infinite lists
elementAt (x:xs) 1 = x
elementAt (x:xs) i = elementAt xs (i-1)

-- interesting solutions:
-- elementAt xs n = last $ take n xs
-- elementAt = flip $ (last .) take   -- this is different from solution, which has take . (+1) which seems to be wrong?