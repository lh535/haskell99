-- using E09, implement run-length encoding: list of tuples with tuple = (num of item, item)

import E09 (pack)

encode :: Eq a => [a] -> [(Int, a)]
encode a = map (\xs -> (length xs, head xs)) (pack a)

-- solutions from website:
-- [(length x, head x) | x <- group xs]
-- same as mine, but pointfree: encode = map (\x -> (length x, head x)) . group

-- encode xs = (enc . pack) xs
-- 	where enc = foldr (\x acc -> (length x, head x) : acc) []