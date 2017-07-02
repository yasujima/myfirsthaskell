{-# LANGUAGE GeneralizedNewtypeDeriving #-}
module Supply
  (
    Supply,
    next,
    runSupply
  ) where

import Control.Monad.State
-- import Control.Applicative
-- import Control.Monad (liftM, ap)

-- instance Functor (Supply s) where
--   fmap = liftM

-- instance Applicative (Supply s) where
--   pure  = return
--  (<*>) = ap

newtype Supply s a = S (State [s] a) deriving (Functor, Applicative)

unwrapS :: Supply s a -> State [s] a
unwrapS (S s) = s

instance Monad (Supply s) where
  s >>= m = S (unwrapS s >>= (unwrapS . m))
  return = S . return

next = S $ do st <- get
              case st of
                [] -> return Nothing
                (x:xs) -> do put xs
                             return (Just x)

runSupply (S m) xs = runState m xs
