{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE OverloadedStrings #-}

module Heather where

import Data.Text (Text)
import qualified Data.ByteString.Lazy as BS
import qualified Data.ByteString.Lazy.Char8 as C
import Data.Aeson as AS
import Control.Applicative
import Control.Monad
import GHC.Generics
import Network.HTTP.Conduit

data Weather = Weather { 
    --weather         :: !Text,
    --description     :: !Text,
    temp            :: Double,
    pressure        :: Double,
    humidity        :: Double,
    minTemp         :: Double,
    maxTemp         :: Double,
    wSpeed          :: Double,
    wDeg            :: Double
    } deriving (Show, Generic)

instance FromJSON Weather where
    parseJSON (Object v) = Weather <$> 
    --    ((v .: "weather") >>= (.: "speed"))         <*>
     --   ((v .: "weather") >>= (.: "description"))   <*>
        ((v .: "main") >>= (.: "temp"))             <*>
        ((v .: "main") >>= (.: "pressure"))         <*>
        ((v .: "main") >>= (.: "humidity"))         <*>
        ((v .: "main") >>= (.: "temp_min"))         <*>
        ((v .: "main") >>= (.: "temp_max"))         <*>
        ((v .: "wind") >>= (.: "speed"))            <*>
        ((v .: "wind") >>= (.: "deg"))
    parseJSON _ = mzero

decodeWeather :: C.ByteString -> Maybe Weather
decodeWeather response = decode response

getWeather :: String -> IO (Maybe Weather)
getWeather s = do
    d <- simpleHttp $ "http://api.openweathermap.org/data/2.5/weather?q=" ++ s
    print d
    print $ decodeWeather d

    return $ decodeWeather d 
