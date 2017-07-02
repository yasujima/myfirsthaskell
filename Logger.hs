module Logger
  (
    Logger,
    Log,
    runLogger,
    record
  ) where

import Control.Applicative -- Otherwise you can't do the Applicative instance.
import Control.Monad (liftM, ap)

instance Functor Logger where
  fmap = liftM

instance Applicative Logger where
  pure  = return
  (<*>) = ap

type Log = [String]
newtype Logger a = Logger { execLogger :: (a, Log)} deriving Show

runLogger :: Logger a -> (a, Log)
runLogger = execLogger

record :: String -> Logger ()
record s = Logger ((), [s])

instance Monad Logger where
  return a = Logger (a, [])
  m >>= k = let (a, w) = execLogger m
                n      = k a
                (b, x) = execLogger n
            in Logger (b, w ++ x)
