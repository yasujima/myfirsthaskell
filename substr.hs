-- http://cheetahs-blog.blogspot.jp/2013/10/haskellpasec.html
import Text.Parsec

substr :: String -> String -> String -> String
substr from to str = case parse parser "error" str of
  Right x -> x
  Left x -> str
  where
    parser = do
      res <- many $ convert <|> string1
      return $ foldl (\a -> \b -> a ++ b) "" res
      
    convert = (try $ string from) >> return to
    string1 = anyChar >>= \x -> return $ x:[]
