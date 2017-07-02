>import System.Environment

test

>main :: IO ()
>main = do
>  args <- getArgs
>  print args
>  name <- getProgName
>  putStrLn name

fname <- getLine
 cont <- readFile fname
 print cont
