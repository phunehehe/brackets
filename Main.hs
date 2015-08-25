{-# LANGUAGE OverloadedStrings #-}

import qualified Data.Attoparsec.Text as A
import qualified Data.Text            as T

import           Data.Attoparsec.Text (Parser)
import           Data.Text            (Text)


data Node a = Leaf a | Branch a a [Node a]
    deriving Show


tab :: Text
tab = "\t"

pairs :: [(Text, Text)]
pairs =
    ("(", ")") :
    ("[", "]") :
    ("{", "}") :
    []

stringReplicate :: Int -> Text -> Text
stringReplicate n s = T.concat $ replicate n s

printSubTree :: Int -> Node Text -> Text
printSubTree level (Leaf x) = stringReplicate level $ T.append tab x
printSubTree level (Branch startSymbol endSymbol subTrees) = T.intercalate "\n"
    [ stringReplicate level $ T.append tab startSymbol
    , T.intercalate "\n" (map (printSubTree (level + 1)) subTrees)
    , stringReplicate level $ T.append tab endSymbol
    ]

printTree :: Node Text -> Text
printTree (Leaf x) = x
printTree (Branch startSymbol endSymbol subTrees) = T.intercalate "\n"
    [ startSymbol
    , T.intercalate "\n" (map (printSubTree 1) subTrees)
    , endSymbol
    ]


getEndSymbol :: Text -> Maybe Text
getEndSymbol start = case filter (\(x, _) -> x == start) pairs of
    [(_, end)] -> Just end
    _ -> Nothing

parseLeaf :: [Text] -> Parser (Node Text)
parseLeaf delimiters = do
    contents <- A.takeTill isDelimiter
    return $ Leaf contents
    where
        isDelimiter c = T.pack [c] `elem` delimiters ++ map fst pairs

parseBranch :: Text -> Text -> Parser (Node Text)
parseBranch start end = do
    nodes <- A.manyTill (parseSomething [end]) (A.string end)
    return $ Branch start end nodes

parseSomething :: [Text] -> Parser (Node Text)
parseSomething delimiters = do
    -- FIXME: this means no multi-char start or end symbols
    c <- A.peekChar'
    case getEndSymbol $ T.pack [c] of
        Just e -> A.anyChar >> parseBranch (T.pack [c]) e
        _ -> parseLeaf delimiters


main :: IO ()
main = do
    input <- getContents
    case A.parseOnly (parseSomething []) (T.pack input) of
        Left _ -> undefined
        Right node -> putStrLn $ T.unpack $ printTree node
