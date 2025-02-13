module ReverseString (reverseString) where
import System.Posix (accessModes)
import qualified Data.ByteString as String

reverseString :: String -> String
reverseString = foldl (flip (:)) []

