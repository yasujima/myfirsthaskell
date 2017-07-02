qs :: (Ord s) => [s] -> [s]
qs [] = []
qs (x:xs) = (qs [ a | a<-xs, a<x ]) ++ [x] ++ (qs [ a | a <- xs, a >= x])
