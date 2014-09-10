module Main (main) where

import Heather
import Data.Text
import Data.Maybe

main :: IO ()
main = do
    w <- getWeather "helsinki"
    print w
    case w of
        Just (Weather {}) -> putStrLn $ tellW $ fromJust w
        Nothing -> print "nope"

tellW :: Weather -> String
tellW w = "Wheather is made of " ++ weather w ++ ", " ++ description w ++ " to be exact. Temperature is around " ++ show (temp w) ++ "C and there's a " ++ show (wSpeed w) ++ " m/s wind from the " ++ show (wDeg w)
