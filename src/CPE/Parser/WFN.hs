{-|
    Module      : WFN
    Description : Data types and parsers for WFNs
    Copyright   : (c) Stephen O'Brien 2016

    License     : MIT
    Maintainer  : wayofthepie@gmail.com
    Stability   : experimental
    Portability :
-}
module CPE.Parser.WFN where

import qualified Data.ByteString as BS

data WFN = WFN
    { part      :: Maybe BS.ByteString
    , vendor    :: Maybe BS.ByteString
    , product   :: Maybe BS.ByteString
    , version   :: Maybe BS.ByteString
    , update    :: Maybe BS.ByteString
    , edition   :: Maybe BS.ByteString
    , language  :: Maybe BS.ByteString
    , swEdition :: Maybe BS.ByteString
    , targetSw  :: Maybe BS.ByteString
    , targetHw  :: Maybe BS.ByteString
    , other     :: Maybe BS.ByteString
    } deriving (Eq, Show)

