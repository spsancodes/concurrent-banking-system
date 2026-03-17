module Account where

import Control.Concurrent.STM

data Account = Account
  { accName :: String
  , balance :: TVar Int
  }

createAccount :: String -> Int -> STM Account
createAccount name initialBalance = do
    bal <- newTVar initialBalance
    return (Account name bal)