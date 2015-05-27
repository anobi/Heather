module Main (main) where

import Heather
import Data.Text
import Data.Maybe
import Control.Exception

main :: IO ()
main = do
    w <- try $ getWeather "helsinki"
    case (w :: Either SomeException (Maybe Weather)) of
     Left e -> print "error"
     Right w -> case w of
                 Just Weather {} -> putStrLn $ tellW $ fromJust w
                 _ -> print "nope"

tellW :: Weather -> String
tellW w = "Wheather is made of " ++ weather w ++ ", " ++ description w ++ " to be exact. Temperature is around " ++ show (temp w) ++ "C and there's a " ++ show (wSpeed w) ++ " m/s wind from the " ++ show (wDeg w)
