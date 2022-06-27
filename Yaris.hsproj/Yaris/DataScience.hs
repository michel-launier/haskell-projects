module DataScience where

-- Composition of function on two lista that gives a folded result. --
(.$) :: (a -> b) -> (c -> d -> a) -> c -> d -> b
(.$) f g c d = f $ g c d

-- Computes the minimum length of two lists. --
minLength a b = min (length a) (length b)
maxLength a b = max (length a) (length b)

-- Computes the square error between two values. --
valueSquareError a b = d * d where d = b - a

-- Computes the square error between two lists. --
squareError = zipWith valueSquareError

-- Computes the sum square error between two lists. --
sumSquareError = sum .$ squareError

-- Compute the mean square error between two lists. --
--meanSquareError a b = (sumSquareError a b) / (minLength a b)

-- Computes the power correlation between two list. --
correlate = zipWith (*)

-- Computes the sum of the correlation between two lists. --
sumCorrelation = sum .$ correlate


--mean :: Fractional a => [a] -> a
--mean a = (sum a) `div` (toFractional (length a))
 
