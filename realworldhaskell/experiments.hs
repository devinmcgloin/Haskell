--data Color = Color ColorRed ColorGreen ColorBlue

--data ColorRed = Int <= 255
--data ColorGreen = Int <= 255
--data ColorBlue = Int <= 255


data Roygbiv = Red
             | Orange
             | Yellow
             | Green
             | Blue
             | Indigo
             | Violet
               deriving (Eq, Show)

--data Colors = Red
--			| Orange
--			| Yellow
--			| Green
--			| Blue
--            | Indigo
--            | Violet
--            | Pink
--              deriving (Eq, Show)


data CalendarTime = CalendarTime {
  ctYear                      :: Int,
  ctMonth                     :: Month,
  ctDay, ctHour, ctMin, ctSec :: Int,
  ctPicosec                   :: Integer,
  ctWDay                      :: Day,
  ctYDay                      :: Int,
  ctTZName                    :: String,
  ctTZ                        :: Int,
  ctIsDST                     :: Bool
}