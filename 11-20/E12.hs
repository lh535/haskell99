-- decode run-length encoding list from E11

import E11

decodeModified :: [EncodeEl a] -> [a]
decodeModified [] = []
decodeModified ((Single x):xs) = x : decodeModified xs
decodeModified ((Multiple n x):xs) = listHelper n x ++ decodeModified xs
    where listHelper 0 x = []
          listHelper n x = x : listHelper (n - 1) x


-- solutions from site: (didn't know about replicate, that would've been rather useful...)

-- decodeModified :: [ListItem a] -> [a]
-- decodeModified = concatMap decodeHelper
--     where
--       decodeHelper (Single x)     = [x]
--       decodeHelper (Multiple n x) = replicate n x