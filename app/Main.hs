module Main where

import ServantHelloWorld (api, server)

import Servant (serve)
import Network.Wai
import Network.Wai.Handler.Warp

main :: IO ()
main = do
  putStrLn "serving on port 8000"
  run 8000 (serve api server)
