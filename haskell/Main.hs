import Control.Concurrent.STM
import Account
import Bank

printBalance :: Account -> IO ()
printBalance acc = do
    bal <- atomically $ readTVar (balance acc)
    putStrLn (accName acc ++ " balance: " ++ show bal)

main :: IO ()
main = do
    putStrLn "=== Concurrent Banking Simulation ==="

    (a,b,c) <- atomically $ do
        a <- createAccount "Account A" 1000
        b <- createAccount "Account B" 1000
        c <- createAccount "Account C" 1000
        return (a,b,c)

    putStrLn "\nInitial Balances:"
    printBalance a
    printBalance b
    printBalance c

    runSimulation [a,b,c]

    putStrLn "\nFinal Balances:"
    printBalance a
    printBalance b
    printBalance c