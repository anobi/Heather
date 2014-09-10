module Main (main) where

import Heather

main :: IO ()
main = do
    w <- getWeather "helsinki"
    print w
