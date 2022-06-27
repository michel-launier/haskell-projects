{-# LANGUAGE TypeSynonymInstances, OverlappingInstances #-}

module Fuzzy where
import Logic

data Fuzzy = Fuzzy Float
    deriving (Eq, Ord, Show)

instance Logic Fuzzy where
    (~||~) (Fuzzy a) (Fuzzy b) = max (Fuzzy a) (Fuzzy b)
    (~&&~) (Fuzzy a) (Fuzzy b) = min (Fuzzy a) (Fuzzy b)
    (~!~)  (Fuzzy a)           = Fuzzy (1-a)
           
fuzzy a | a < 0     = Fuzzy 0
        | a > 1     = Fuzzy 1
        | otherwise = Fuzzy a

-- Should we keep this !!!
fnot (Fuzzy a) = (~!~) (Fuzzy a)
