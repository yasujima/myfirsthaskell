-- ptriples.hs
import Control.Monad

ptriples = do
  a <- [1..]
  b <- [1..a]
  c <- [a..a+b]
  guard (a*a + b*b == c*c)
  return (b, a, c)
  
main = mapM_ print ptriples