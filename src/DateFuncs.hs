
module DateFuncs
( getPrevMonth
, getLinesWithMonth
) where

import Text.Regex.PCRE
    
getPrevMonth :: (Integer,Int,Int) -> (Integer,Int)
getPrevMonth (year,month,day) 
    | month < 1 = error "Invalid month"
    | month == 1 = (year-1,12)
    | month < 13 = (year,month-1)
    | otherwise = error "Invalid month"
    
getLinesWithMonth :: (Integer,Int) -> [String] -> [String]
getLinesWithMonth (year,month) lines = filter (\line -> line =~ ("^\\s*\"" ++ show month)) lines


