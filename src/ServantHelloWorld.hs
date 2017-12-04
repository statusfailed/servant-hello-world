{-# LANGUAGE DataKinds     #-}
{-# LANGUAGE TypeOperators #-}
module ServantHelloWorld where

import Servant

import Data.Time
import Data.Aeson
import Control.Monad.IO.Class (liftIO)

type API
    = Get '[JSON] String
  :<|> "echo" :> Capture "value" String :> Get '[JSON] String
  :<|> "time" :> Get '[JSON] UTCTime

api :: Proxy API
api = Proxy

server :: Server API
server = root :<|> echo :<|> time
  where
    root     = return "Hello, World"
    echo str = return str
    time     = liftIO getCurrentTime
