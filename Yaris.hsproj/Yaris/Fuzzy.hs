module Fuzzy where
  
import Normalize

data Fuzzy = FuzzyValue Float
           | FuzzyLinear [(Float,Float)]
           deriving ( Show, Eq, Ord )

toFuzzy low high value   = FuzzyValue $ normalize low high value

fromFuzzy low high (FuzzyValue ratio) = FuzzyValue $ denormalize low high ratio

fuzzyLinear :: [(Float,Float)] -> Fuzzy -> Fuzzy
fuzzyLinear [] _                                                     = FuzzyValue 0
fuzzyLinear ((x1,y1):[]) (FuzzyValue x)                              = FuzzyValue y1
fuzzyLinear ((x1,y1):(x2,y2):[]) (FuzzyValue x) | x <= x1            = FuzzyValue y1
fuzzyLinear ((x1,y1):(x2,y2):[]) (FuzzyValue x) | x >= x2            = FuzzyValue y2
fuzzyLinear ((x1,y1):(x2,y2):xs) (FuzzyValue x) | x >= x1 && x <= x2 = FuzzyValue (y1 + (x-x1)/(x2-x1)*(y2-y1))
fuzzyLinear ((x1,y1):(x2,y2):xs) (FuzzyValue x) | x > x2             = fuzzyLinear ((x2,y2):xs) (FuzzyValue x)

fuzzyAnd :: Fuzzy -> Fuzzy -> Fuzzy
fuzzyAnd (FuzzyValue x) (FuzzyValue y) = FuzzyValue (min x y)
