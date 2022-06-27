module Genetic where
  
import Data.Sort
  
-- Define the properties of an individual --
class Individual a where
  create    :: a
  evaluate  :: a -> Float
  mutate    :: a -> a
  reproduce :: a -> a -> a  
  
--data GeneticAlgorithm = GeneticAlgorithm {
--    individualType :: Individual
--  , populationSize :: Int
--  , generations    :: Int 
--} deriving Show


createPopulation :: (Individual a) => a -> Int -> [a]
createPopulation _ 0 = []
createPopulation t x = create : createPopulation t (x-1)

data Fred = Fred [Int]
  deriving Show


instance Individual Fred where
  create     = Fred [1,2,3]
  evaluate _ = 1.0
  mutate    (Fred (x:xs))               = Fred  ((x+1) : xs)
  reproduce (Fred (x:xs)) (Fred (y:ys)) = Fred (x:ys)
  

  
 