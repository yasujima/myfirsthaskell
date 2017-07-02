>import System.Environment

test

>main :: IO ()
>main = do
  -- fname <- getLine
  -- cont <- readFile fname
  -- print cont
>  args <- getArgs
>  print args
>  name <- getProgName
>  putStrLn name
