-- -- decode run-length encoding list from E11

import E11 (EncodeEl, encodeModified)

decodeModified :: [EncodeEl a] -> [a]
decodeModified 