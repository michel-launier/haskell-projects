module Test where
  
map' f =  foldr (\x acc -> f x : acc) []
  
reverse' = foldl (flip (:)) []

filter' f = foldr (\x acc -> if f x then x : acc else acc) []

last' = foldl1 (\_ a -> a)

