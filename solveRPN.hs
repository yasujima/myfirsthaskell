import Data.List

solveRPN :: (Num a, Read a) => String -> a
solveRPN expression = head (foldl foldingFunction [] (words expression))
  where foldingFunction (x:y:yz) "*" = (x * y):yz
        foldingFunction (x:y:yz) "+" = (x + y):yz
        foldingFunction (x:y:yz) "-" = (y - x):yz
        foldingFunction xs num = read num:xs