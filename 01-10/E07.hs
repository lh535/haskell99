-- flatten a NestedList

data NestedList a = Elem a | List [NestedList a]  -- because lists are homogenous in haskell

flatten :: NestedList a -> [a]
flatten (Elem x) = [x]
flatten (List []) = []
flatten (List (x:xs)) = flatten x ++ flatten (List xs)

-- some solutions:
-- line 8 could be instead: flatten (List x) concatMap flatten x
-- could also use foldMap, or accumulator function
-- could also derive foldable and use toList, with LANGUAGE DeriveFoldable