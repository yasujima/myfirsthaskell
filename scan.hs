#!/usr/bin/env runghc
--main = putStrLn . show $ scanl (+) 0 [1,2,3,4,5]
--main = print $ scanl (+) 0 [1,2,3,4,5]
--main = print $ lengh (takeWhile (< 1000) (scanl1 (+) (map sqrt [1..]))) + 1
--main = print $ takeWhile (< 1000) (scanl1 (+) (map sqrt [1..]))
main = print $ takeWhile (< 10) (map sqrt [1..])


