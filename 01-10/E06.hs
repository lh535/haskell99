-- check if list is palindrome

isPalindrome :: Eq a => [a] -> Bool
isPalindrome xs = xs == reverse xs  -- I feel like this is almost cheating...

-- very interesting solutions for this one!
-- isPalindrome = (==) <*> reverse   -- note that "(->) a" is instance of applicative!
-- isPalindrome = foldr (&&) True $ zipWith (==) xs (reverse xs)

-- half as many compares:
-- palindrome xs = p [] xs xs
--    where p rev (x:xs) (_:_:ys) = p (x:rev) xs ys  -- just to split into two halves (in arg1 and arg2)
--          p rev (x:xs) [_] = rev == xs -- for something like anbna
--          p rev xs [] = rev == xs  -- for something like anna