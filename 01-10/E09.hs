-- pack consecutive duplicates into sublists
module E09 (pack) where 
import Test.QuickCheck

-- Didn't want to use too many already implemented functions for this one
pack :: Eq a => [a] -> [[a]]
pack [] = []
pack (x:xs) =
    let
        f x (y:ys) | x == y = (x : fst (f y ys), snd $ f y ys)
        f x ys              = ([x], ys)
        (sublist, rest) = f x xs
    in
        sublist : pack rest

-- shorter:
pack2 :: Eq a => [a] -> [[a]]
pack2 [] = []
pack2 list@(x:xs) = takeWhile (x==) list : pack (dropWhile (x==) xs)

packProp x = pack x == pack2 x  -- for testing

------------- interesting solutions from website: -----------------------

-- span gets longest prefix and returns rest. so:
-- pack (x:xs) = let (first,rest) = span (==x) xs
--                in (x:first) : pack rest
-- pack [] = []

-- pack :: (Eq a) => [a] -> [[a]]
-- pack = foldr func []
--     where func x []     = [[x]]
--           func x (y:xs) =
--               if x == (head y) then ((x:y):xs) else ([x]:y:xs)