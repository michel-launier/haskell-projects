import System.Random

data GeneOperation = Clone | Mutation | Crossover deriving (Show, Enum, Bounded)

instance Random GeneOperation where
  randomR (a, b) g =
    case randomR (fromEnum a, fromEnum b) g of
      (x, g') -> (toEnum x, g')
  random g = randomR (minBound, maxBound) g

main = do
  g <- newStdGen
  print . take 10 $ (randoms g :: [GeneOperation])


nbOfParameters Clone     = 1
nbOfParameters Mutation  = 1
nbOfParameters Crossover = 2

