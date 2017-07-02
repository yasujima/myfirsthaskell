import Data.Char
import Text.Parsec
import Text.Parsec.String

data Exp = Add Exp Exp | Mul Exp Exp | Nat Int deriving Show

expr :: Parser Exp
expr = do
  t <- term
  do
      char '+'
      e <- expr
      return (Add t e)
    <|> return t

term :: Parser Exp
term = do
  f <- factor
  do
      char '*'
      t <- term
      return (Mul f t)
    <|> return t

factor :: Parser Exp
factor = paren <|> nat
  where
    paren = do
      char '('
      e <- expr
      char ')'
      return e

nat :: Parser Exp
nat = do
  c <- oneOf ['0'..'9']
  return (Nat (charToInt c))
  where
    charToInt c = ord c - ord '0'
