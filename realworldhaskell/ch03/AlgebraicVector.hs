-- file: ch03/AlgebraicVector.hs
-- x and y coordinates or lengths.
data Cartesian2D = Cartesian2D {
	  x :: Double 
	, y :: Double
	} deriving (Eq, Show)

-- Angle and distance (magnitude).
data Polar2D = Polar2D Double Double
               deriving (Eq, Show)


distOrigin :: Cartesian2D -> Double
distOrigin point = sqrt((x point)**2 + (y point)**2)