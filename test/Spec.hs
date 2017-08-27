import Test.Tasty
import Test.Tasty.HUnit
import DateFuncs

main :: IO ()
main = defaultMain unitTests

unitTests = 
    testGroup "Unit Tests"
    [ gpm1, gpm2 ]

gpm1 = testCase "getPrevMonth test 1" $ assertEqual [] (2017,4) (getPrevMonth (2017,5,1))
gpm2 = testCase "getPrevMonth test 2" $ assertEqual [] (2017,12) (getPrevMonth (2017,11,1))
