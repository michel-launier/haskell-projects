module Normalize where
  
-- unbounded proportional ratio. --
ratio low high value = (value - low) / (high - low)

-- linear interpolation. --
lerp low high ratio = low + (high - low) * ratio

-- unbounded remaps a value from an input range to an output range. --
remap outLow outHigh inLow inHigh value
  = lerp outLow outHigh $ ratio inLow inHigh value
 
-- bounded proportional ratio. --
boundedRatio low high value
  | value < low  = 0.0
  | value > high = 1.0
  | otherwise    = ratio low high value
  
-- bounded linear interpolation. --
boundedLerp low high ratio
  | ratio < 0.0 = low
  | ratio > 1.0 = high
  | otherwise   = lerp low high ratio
  
-- bounded remaps a value from an input range to an output range. --
boundedRemap outLow outHigh inLow inHigh value
  = lerp outLow outHigh $ boundedRatio inLow inHigh value
  

normalize   = boundedRatio
denormalize = boundedLerp

normalize2 = boundedRemap


-- Test --
