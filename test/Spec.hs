import Test.Tasty
import Test.Tasty.HUnit
import DateFuncs

main :: IO ()
main = defaultMain unitTests

unitTests = 
    testGroup "Unit Tests"
    [ gpm1, gpm2, gpm3  ]

gpm1 = testCase "getPrevMonth test 1" $ assertEqual [] (2017,4) (getPrevMonth (2017,5,31))
gpm2 = testCase "getPrevMonth test 2" $ assertEqual [] (2017,10) (getPrevMonth (2017,11,1))
gpm3 = testCase "getPrevMonth test 3" $ assertEqual [] (2016,12) (getPrevMonth (2017,1,14))
