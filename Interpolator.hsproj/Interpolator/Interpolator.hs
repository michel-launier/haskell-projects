module Interpolator where
  
type Input = [Float]
type Ouput = [Float]

componentProduct = zipWith (*)
dotProduct x y = foldr (+) 0 (componentProduct x y)
sqrLength x = dotProduct x x
length = sqrt.sqrLength

