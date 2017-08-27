module DateFuncs
( getPrevMonth
) where

monthStr :: Int -> String
monthStr 1 = "Jan"
monthStr 2 = "Feb"
monthStr 3 = "Mar"
monthStr 4 = "Apr"
monthStr 5 = "May"
monthStr 6 = "Jun"
monthStr 7 = "Jul"
monthStr 8 = "Aug"
monthStr 9 = "Sep"
monthStr 10 = "Oct"
monthStr 11 = "Nov"
monthStr 12 = "Dec"

getPrevMonth :: (Integer,Int,Int) -> (Integer,Int)
getPrevMonth (year,month,day) = if month == 1
    then
        (year -1, 12)
    else
        (year,month-1)