{-# LANGUAGE DuplicateRecordFields #-}

module Script where

data NodeType = System
              | SubSystem
              | Module
              | ExecutionFrame
              | Function
  deriving (Show)  
  
data PortType = Ingress
              | Outgress
              | Enable
              | Trigger
  deriving (Show)
  

data Node = Node {
  nodeType :: NodeType
} deriving (Show)

data Version = Version {
  major :: Int,
  minor :: Int,
  build :: Int
} deriving (Show)
  
type ScriptId = String

data VisualScript = VisualScript {
  scriptId      :: ScriptId,
  fileName      :: String,
  scriptType    :: String,
  scriptVersion :: Version,
  engineVersion :: Version,
  rootNodeType  :: NodeType
} deriving (Show)

data VariableSignature = VariableSignature {
  name :: String,
  classConstraints :: [(String,Protocol)]
} deriving (Show)

data FunctionSignature = FunctionSignature {
  name :: String
} deriving (Show)

---

data Protocol = Protocol {
  name :: String,
  extends :: [Protocol],
  parameters :: [(String,Protocol)],
  classConstraints :: [(String,Protocol)],
  functions :: [FunctionSignature]
} deriving (Show)


