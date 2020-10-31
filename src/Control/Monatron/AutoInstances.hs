{-# Language FlexibleInstances #-}
{-# language OverlappingInstances #-}
{-# language IncoherentInstances #-}

module Control.Monatron.AutoInstances where

import Control.Monatron.MonadT
import Control.Monad.Fail as F

------------------------------------------------------------------
instance (Monad m, MonadT t) => Monad (t m) where
    return = pure
    (>>=)  = tbind

instance (MonadFail m, MonadT t) => MonadFail (t m) where
    fail   = lift . F.fail

instance (Monad m, MonadT t) => Functor (t m) where fmap = liftM

instance (Monad m, MonadT t) => Applicative (t m) where
  pure = treturn
  (<*>) = ap
