-- modfiied run-length encoding, where single elements are left as-is

import E09 (pack)

data EncodeEl a = Multiple Int a | Single a
    deriving Show

encodeModified :: Eq a => [a] -> [EncodeEl a]
encodeModified = map f . pack
    where f [x] = Single x
          f xs = Multiple (length xs) (head xs)

-- one-liner solution from website:
-- encodeModified xs = [y | x <- group xs, let y = if (length x) == 1 then Single (head x) else Multiple (length x) (head x)]