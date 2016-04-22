-- |
-- Bidirectional version of "Data.Either".
{-# LANGUAGE Safe #-}
module Data.Invertible.Either
  ( switch
  , isLeft
  , isRight
  , lft
  , rgt
  ) where

import Prelude

import Data.Invertible.Bijection
import Data.Invertible.TH

-- |Convert between 'Left' and 'Right'.
switch :: Either a b <-> Either b a
switch =
  [biCase|
    Left a <-> Right a
    Right a <-> Left a
  |]

-- |Convert between 'Left' and 'True' (see 'Data.Either.isLeft').
isLeft :: Either () () <-> Bool
isLeft =
  [biCase|
    Left () <-> True
    Right () <-> False
  |]

-- |Convert between 'Right' and 'True' (see 'Data.Either.isRight'). (@'Data.Invertible.Bool.not' . 'isLeft'@) 
isRight :: Either () () <-> Bool
isRight =
  [biCase|
    Right () <-> True
    Left () <-> False
  |]

-- |Convert between 'Left' and 'Just'.
lft :: Either a () <-> Maybe a
lft =
  [biCase|
    Left a <-> Just a
    Right () <-> Nothing
  |]

-- |Convert between 'Right and 'Just'.
rgt :: Either () a <-> Maybe a
rgt =
  [biCase|
    Left () <-> Nothing
    Right a <-> Just a
  |]