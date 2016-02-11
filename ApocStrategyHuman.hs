module ApocStrategyHuman where

import Control.Monad
import Control.Monad.Trans.State.Lazy
import Data.Maybe (fromJust, isNothing)
import System.IO.Unsafe
import ApocTools
import Data.Char

{- | This is just a placeholder for the human strategy: it always chooses to play
     (0,0) to (2,1).
-}
human    :: Chooser
human b Normal        c = getMove
human b PawnPlacement c = return (Just [(2,2)])



getMove = do
    putStrLn "Enter the move coordinates for player Black in the form 'srcX srcY destX destY'\n(0 >= n >= 4, or just enter return for a 'pass') B2:" --Prompt the user
    input <- getLine --set input to the input the user enters
    return (Just[(digitToInt(input!!0), digitToInt(input!!2)), (digitToInt(input!!4), digitToInt(input!!6))]) --return an array with integers, or nothing

{-

getGameMode :: IO ()
getGameMode = do
	argList <- getArgs
	evalArgList argList


argsNotGiven :: IO ()    
argsNotGiven = do
    putStrLn "Possible strategies: \n\thuman\n\tgreedy\nEnter the strategy for BLACK:"
    blackChoice <-getLine
    when (blackChoice /= "greedy" && blackChoice /= "human") $ do 
            putStrLn "  human"
            putStrLn "  greedy"
            
    putStrLn "Enter the strategy for WHITE:"
    whiteChoice <-getLine
    when (whiteChoice /= "greedy" && whiteChoice /= "human") $ do 
            putStrLn "  human"
            putStrLn "  greedy"
    putStrLn ">>>"
    --return list of whiteChoice and blackChoice to main somehow


evalArgList :: [String] -> IO ()
evalArgList [] = argsNotGiven
evalArgList [x] = argsNotGiven
evalArgList (x:y:[]) 
 | (validMode x) && (validMode y) = putStrLn "Terminate"
 | otherwise = argsNotGiven


validMode :: String -> Bool
validMode x 
 | x == "human" = True
 | x == "greedy" = True
 | otherwise = False

--///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
-}



getGameMode :: IO [String]
getGameMode = do
    putStrLn "Possible strategies: \n\thuman\n\tgreedy\nEnter the strategy for BLACK:"
    blackChoice <-getLine
    when (blackChoice /= "greedy" && blackChoice /= "human") $ do 
            putStrLn "  human"
            putStrLn "  greedy"
            
    putStrLn "Enter the strategy for WHITE:"
    whiteChoice <-getLine
    when (whiteChoice /= "greedy" && whiteChoice /= "human") $ do 
            putStrLn "  human"
            putStrLn "  greedy"
    putStrLn ">>>"
    let choices = [blackChoice, whiteChoice]
    return choices




