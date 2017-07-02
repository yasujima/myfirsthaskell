
rep :: (Enum n, Num n) => n -> a -> [a]
rep x a =  [a| _ <-[0..x] ]

pyth :: Int -> [(Int,Int,Int)]
pyth n = [(a,b,c)|a<-[1..n],b<-[1..n],c<-[1..n], a^2+b^2==c^2]
