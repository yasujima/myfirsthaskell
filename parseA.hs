import Text.Parsec

p = char 'a' >> char 'b' >> char 'c' >> return "matched!!"
main = do
  cont <- getContents
  parseTest p cont