module Ai where
  
subdivide :: (a->[a]) -> a -> [a]
subdivide f a = f a


forAllIntegers f = [f x | x <- [0..] ]

