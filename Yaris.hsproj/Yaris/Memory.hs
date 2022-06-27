module Memory where
  
type Weight = Float
type Name   = String

data Mem = Node { name :: String, links :: [Mem] }
         | Link { name :: String, weight :: Weight, node1 :: Mem, node2 :: Mem }
         | OneOf { node :: Mem, nodes :: [(Weight, Mem)] }
         | AnyOf { node :: Mem, nodes :: [(Weight, Mem)] }
         | AllOf { node :: Mem, nodes :: [(Weight, Mem)] }
     deriving (Show)
     
         
