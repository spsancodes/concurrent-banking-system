module Bank where

import Control.Concurrent
import Control.Concurrent.STM
import System.Random
import Account
import Transaction

simulateTransfer :: Account -> Account -> Int -> IO ()
simulateTransfer from to amount = do
    result <- atomically $ transfer from to amount
    if result
       then putStrLn (accName from ++ " -> " ++ accName to ++ " : " ++ show amount)
       else putStrLn ("Transfer failed from " ++ accName from)

randomTransfer :: [Account] -> IO ()
randomTransfer accounts = do
    i <- randomRIO (0, length accounts - 1)
    j <- randomRIO (0, length accounts - 1)
    amount <- randomRIO (10,100)

    let from = accounts !! i
    let to = accounts !! j

    if i /= j
       then simulateTransfer from to amount
       else return ()

runSimulation :: [Account] -> IO ()
runSimulation accounts = do
    putStrLn "\nRunning 100 concurrent transactions...\n"

    mapM_ (\_ -> forkIO $ randomTransfer accounts) [1..100]

    threadDelay 3000000