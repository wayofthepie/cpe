{-# LANGUAGE OverloadedStrings #-}

import qualified Data.ByteString.Char8 as BS
import Data.Maybe
import Data.Monoid
import Test.Tasty
import Test.Tasty.QuickCheck as QC

import CPE.Parser.WFN

import Debug.Trace


main :: IO ()
main = defaultMain qcProps

qcProps :: TestTree
qcProps = testGroup "cpe tests"
    [ testProperty "???" prop_wfn_parse ]


data AllowedWFN = AllowedWFN
    { wfnBs     :: BS.ByteString
    , actualWfn :: WFN
    } deriving (Eq, Show)

instance Arbitrary AllowedWFN where
    arbitrary = do
        partBs <- genPartVal
        return $ AllowedWFN
            ("part=" <> partBs)
            (WFN
                (Just partBs) -- part
                Nothing
                Nothing
                Nothing
                Nothing
                Nothing
                Nothing
                Nothing
                Nothing
                Nothing
                Nothing)

-- Create generators for each allowed attribute and possible values

-- Generator for a _part_. The _part_ attribute SHALL be either "a", "o" or "h",
-- SHALL is not a hard constraint, but this generator only generates those
-- three letters.
genPartVal :: Gen BS.ByteString
genPartVal = BS.pack <$> elements ["a", "o", "h"]

{-
genWfnBs :: Gen AllowedWFN
genWfnBs = do
    partBs <- genPart
fmap (Gen a -> a) [genPart, genVendor]
-}
prop_wfn_parse :: AllowedWFN -> Bool
prop_wfn_parse (AllowedWFN wfnBs actual) = traceShow (part actual)$ traceShow wfnBs $ fromJust (part actual) == wfnBs
