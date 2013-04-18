-- Example
--
-- $ ghc --make controller.hs
-- $ ./controller
module Controller where

import ControllerTest
import System.Environment
import Data.Maybe

main :: IO ()
main = do
     a <- getArgs
     let f = fromMaybe "../dot/candidate.dot" $ listToMaybe a 
     dotGraph <- importDotFile f 
     putStrLn "nodes:"
     putStrLn $ show $ nodeList dotGraph
     putStrLn "connections:"
     putStrLn $ show $ edgeList dotGraph
     return ()
