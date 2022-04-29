-- direct implementation for run-length encoding of list (no sublists, only counting)

import E11 (EncodeEl(..))

-- I feel like this is all not too clever, I just coded my first idea. Not too fond packing things in tuples
encodeHelper :: a -> Int -> EncodeEl a
encodeHelper x 1 = Single x
encodeHelper x n = Multiple n x

encodeDirect :: Eq a => [a] -> [EncodeEl a]
encodeDirect [] = []
encodeDirect (x:xs) = fst (makeEl x xs 1) : encodeDirect (snd $ makeEl x xs 0)
    where makeEl x [] n = (encodeHelper x n, [])
          makeEl x r@(y:ys) n | x == y    = makeEl x ys (n + 1)
                              | otherwise = (encodeHelper x n, r)


-- solution I liked from the site: (I keep forgetting about the existance of span)
-- encodeDirect :: (Eq a)=> [a] -> [ListItem a]
-- encodeDirect [] = []
-- encodeDirect (x:xs)
--     | count==1  = (Single x) : (encodeDirect xs)
--     | otherwise = (Multiple count x) : (encodeDirect rest)
--     where
--         (matched, rest) = span (==x) xs
--         count = 1 + (length matched)