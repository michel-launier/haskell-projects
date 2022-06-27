module Logic where
    
class Logic a where
    (~||~), (~&&~) :: a -> a -> a
    (~!~)          :: a -> a
    
instance Logic Bool where
    (~||~) True _  = True
    (~||~) _ True  = True
    (~||~) _ _     = False
    (~&&~) False _ = False
    (~&&~) _ False = False
    (~&&~) _ _     = True
    (~!~)  True    = False
    (~!~)  False   = True

