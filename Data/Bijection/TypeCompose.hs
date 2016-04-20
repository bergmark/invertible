-- |
-- Convert bijections to and from TypeCompose 'Bijection'.
module Data.Bijection.TypeCompose
  ( toBi
  , fromBi
  ) where

import Data.Bijection.Type
import qualified TypeCompose.Data.Bijection as T

-- |Convert an isomorphism to semigroupoid form.
toBi :: Bijection a b c -> T.Bijection a b c
toBi (f :<->: g) = T.Bi f g

-- |Convert semigroupoid form to an isomorphism.
fromBi :: T.Bijection a b c -> Bijection a b c
fromBi (T.Bi f g) = f :<->: g
