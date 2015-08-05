import qualified Data.Attoparsec.Text.Lazy as A

import           Data.List                 (intercalate)


data Tree a = Leaf a | Branch a a [Tree a]
    deriving Show


tab :: String
tab = "\t"

startSymbols :: [String]
startSymbols =
    "(" :
    "[" :
    "{" :
    []

endSymbols :: [String]
endSymbols =
    ")" :
    "]" :
    "}" :
    []

stringReplicate :: Int -> String -> String
stringReplicate n s = concat $ replicate n s

printSubTree :: Int -> Tree String -> String
printSubTree level (Leaf x) = stringReplicate level tab ++ x
printSubTree level (Branch startSymbol endSymbol subTrees) = intercalate "\n"
    [ stringReplicate level tab ++ startSymbol
    , intercalate "\n" (map (printSubTree (level + 1)) subTrees)
    , stringReplicate level tab ++ endSymbol
    ]

printTree :: Tree String -> String
printTree (Leaf x) = x
printTree (Branch startSymbol endSymbol subTrees) = intercalate "\n"
    [ startSymbol
    , intercalate "\n" (map (printSubTree 1) subTrees)
    , endSymbol
    ]


parseTree :: A.Parser (Tree String)
parseTree = undefined


main :: IO ()
main = do
    input <- getContents
    putStrLn $ printTree $ Branch "[" "]" [Leaf "blah", Branch "(" ")" [Leaf "asdf"], Leaf "bleh"]
