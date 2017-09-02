module Main where
import System.IO
--    import Data.List.Split
import Data.Time.Clock
import Data.Time.Calendar
import DateFuncs
import Text.Regex.PCRE

-- The debit amount is the value before the word 'debit'
-- Two digits after the decimal are always present
getDebit :: String -> Float
getDebit line = do
    let m = line =~ "\"(\\d+\\.\\d\\d)\"\\s*,\\s*\"debit\"" :: [[String]]
    -- debit value emerges from this regex looking like this:
    -- [["\"4.91\",\"debit\"","4.91"]]
    -- This is a list of lists.  Each list item is a list of match string followed by groups
    -- To extract 4.91 we have to do some stupid gyrations compare to other languages
    let debit = head (tail (head m))
    -- now debug is just a string "4.91"
    read debit :: Float

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
    putStrLn $ unlines linesWithMonth
    let allDebits = map getDebit linesWithMonth
    print allDebits
    

