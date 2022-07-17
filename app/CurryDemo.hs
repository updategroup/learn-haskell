module CurryDemo where
    
multThree :: (Num a) => a -> a -> a ->a 
multThree x y z = z * y * z