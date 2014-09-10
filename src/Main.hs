module Main (main) where

import Heather
import Data.Text
import Data.Maybe

main :: IO ()
main = do
    w <- getWeather "helsinki"
    print w
    case w of
        Just (Weather {}) -> print $ tellW $ fromJust w
        Nothing -> print "nope"

tellW :: Weather -> String
tellW w = "Wheather is made of " ++ unpack (weather w) ++ ", " ++ unpack (description w) ++ " to be exact. Temperature is around " ++ show ((temp w) - 273.15) ++ " MURICAs and there's a " ++ show (wSpeed w) ++ " m/s wind from the " ++ show (wDeg w)
