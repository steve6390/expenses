module Main where
import System.IO
--    import Data.List.Split
import Data.Time.Clock
import Data.Time.Calendar
import DateFuncs

main :: IO ()
main = do
    putStrLn "Transaction helper, 0.1"
    today <- (toGregorian . utctDay) <$> getCurrentTime
    print today
    let lastMonth = getPrevMonth today 
    print lastMonth
    transactions <- lines <$> readFile "transactions.csv"
    putStrLn $ "Total transactions: " ++ show (length transactions)
    let linesWithMonth = getLinesWithMonth lastMonth transactions
    putStrLn $ "transactions last month: " ++ show (length linesWithMonth)
    print $ getLinesWithMonth lastMonth transactions

