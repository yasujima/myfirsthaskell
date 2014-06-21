import Text.Parsec

p = string "abc" >> return "matched!!"
main = do
  cont <- getContents
  parseTest p cont