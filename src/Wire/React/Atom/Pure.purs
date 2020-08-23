module Wire.React.Atom.Pure where

import Prelude
import Effect (Effect)
import Wire.Signal (Signal)
import Wire.Signal as Signal
import Wire.React.Atom.Class (class Atom)

newtype Pure a
  = Pure
  { initial :: a
  , signal :: Signal a
  , modify :: (a -> a) -> Effect Unit
  }

create :: forall a. a -> Effect (Pure a)
create initial = do
  { signal, modify } <- Signal.create initial
  pure $ Pure { initial, signal, modify }

instance atomPure :: Atom Pure where
  default (Pure atom) = atom.initial
  read (Pure atom) = Signal.read atom.signal
  modify (Pure atom) = atom.modify
  reset (Pure atom) = atom.modify (const atom.initial)
  subscribe (Pure atom) = Signal.subscribe atom.signal
  signal (Pure atom) = atom.signal
