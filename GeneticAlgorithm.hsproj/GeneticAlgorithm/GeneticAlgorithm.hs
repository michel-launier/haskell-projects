module GeneticAlgorithm where
  
import System.Random

type Gene       = Float
type Individual = [Gene]
type Population = [Individual]
type City       = [Population]

data GaOperator = Clone Individual
                | Mutate Individual
                | CrossOver Individual Individual
  deriving Show



-- Genetic operators --
clone :: Individual -> Individual
clone = id

mutate :: (Individual -> Individual) -> Individual -> Individual
mutate op i = op i

crossOver :: (Individual -> Individual -> Individual) -> Individual -> Individual -> Individual
crossOver op a b = op a b
