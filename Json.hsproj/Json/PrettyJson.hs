module PrettyJson where
  
import Json
import Data.List (intercalate)

-- Rendering for Json types. --
renderJValue :: JValue -> String
renderJValue (JString s)   = show s
renderJValue (JNumber n)   = show n
renderJValue (JBool True)  = "true"
renderJValue (JBool False) = "false"
renderJValue JNull         = "null"
renderJValue (JObject o)   = "{" ++ pairs o ++ "}"
  where pairs [] = ""
        pairs ps = intercalate ", " (map renderPair ps)
        renderPair (k,v) = show k ++ ": " ++ renderJValue v
renderJValue (JArray a)    = "[" ++ values a ++ "]"
  where values [] = ""
        values vs = intercalate ", " (map renderJValue vs)
        

-- Json IO output. --
putJValue :: JValue -> IO ()
putJValue = putStrLn.renderJValue