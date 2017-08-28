module Main where
import System.IO
--    import Data.List.Split
import Data.Time.Clock
import Data.Time.Calendar
import DateFuncs

main :: IO ()
main = do
    putStrLn "Transaction helper, 0.1"
    printableDate <- (toGregorian . utctDay) <$> getCurrentTime
    print printableDate
    let printableLastMonth = getPrevMonth printableDate 
    print printableLastMonth
    contents <- readFile "transactions.csv"
    let contentLines = lines contents
    print $ getLinesWithMonth printableLastMonth contentLines
