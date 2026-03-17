module Transaction where

import Control.Concurrent.STM
import Account

deposit :: Account -> Int -> STM ()
deposit acc amount = do
    bal <- readTVar (balance acc)
    writeTVar (balance acc) (bal + amount)

withdraw :: Account -> Int -> STM Bool
withdraw acc amount = do
    bal <- readTVar (balance acc)
    if bal >= amount
       then do
            writeTVar (balance acc) (bal - amount)
            return True
       else return False

transfer :: Account -> Account -> Int -> STM Bool
transfer from to amount = do
    success <- withdraw from amount
    if success
       then do
            deposit to amount
            return True
       else return False