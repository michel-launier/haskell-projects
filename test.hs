{-# LANGUAGE TypeSynonymInstances, OverlappingInstances #-}

data Shape = Circle Float
           | Square Float



fuzzy_add a b= ((-) 1).((*) a) b

inc= (+ 1)

dec= flip (-) 1
    
fuzzy_sub = (*)

data Tree a = Leaf a | Branch (Tree a) (Tree a)
