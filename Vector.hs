module Vector where
	
type Scalar = Float
type Vector = [Scalar]

vAdd     = zipWith (+)
vSub     = zipWith (-)
vScale s = map (* s)
vDot a b = foldl (+) 0 $ zipWith (*) a b

vSqrMagnitude = foldl mac 0
	where mac acc x = acc + x*x

vMagnitude = sqrt.vSqrMagnitude

vNormalized v = adj (vMagnitude v) v
	where adj 0 _ = Nothing
	      adj m v = Just $ vScale (1/m) v

vCos a b = adj (vMagnitude a) (vMagnitude b) (vDot a b)
	where adj 0 _ _ = Nothing
	      adj _ 0 _ = Nothing
	      adj m1 m2 d = Just $ d / (m1 * m2)

vDistance a b = vMagnitude $ vSub a b
    
vIsSameDirection a b = maybe Nothing (\x-> Just $ x > 0) (vCos a b)

vLerp r a b = vAdd a $ vScale (1-r) $ vSub b a