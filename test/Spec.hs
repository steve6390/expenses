import Test.Tasty
import Test.Tasty.HUnit
import DateFuncs

gpm1 = testCase "getPrevMonth test 1" $ assertEqual [] (2017,4) (getPrevMonth (2017,5,31))
gpm2 = testCase "getPrevMonth test 2" $ assertEqual [] (2017,11) (getPrevMonth (2017,12,1))
gpm3 = testCase "getPrevMonth test 3" $ assertEqual [] (2016,12) (getPrevMonth (2017,1,14))

unitTests = 
    testGroup "Unit Tests"
    [ gpm1, gpm2, gpm3 ]

main :: IO ()
main = defaultMain unitTests
