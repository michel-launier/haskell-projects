module Polygon where
    
data Vector2= Vector2 Float Float
    deriving Show
    
data Polygon2D= Polygon2D [Vector2]
    deriving Show

add2D (Vector2 x1 y1) (Vector2 x2 y2)= Vector2 (x1+x2) (y1+y2)
scale2D scale (Vector2 x y)= Vector2 (x*scale) (y*scale)

sum2D= foldr add2D (Vector2 0 0) 
