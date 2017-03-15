{-# LANGUAGE OverloadedStrings #-}

import qualified Data.Attoparsec.Text as A
import qualified Data.Text            as T
import qualified Data.Text.IO         as TIO

import           Control.Applicative  (many)
import           Data.Attoparsec.Text (Parser)
import           Data.Text            (Text)


data Node a = Leaf a | Branch a a [Node a]
    deriving Show


-- LOL tabs!
tab :: Text
tab = "  "

{-# ANN pairs ("HLint: ignore Use list literal" :: String) #-}
pairs :: [(Text, Text)]
pairs =
    ("(", ")") :
    ("[", "]") :
    ("{", "}") :
    []


stringReplicate :: Int -> Text -> Text
stringReplicate n s = T.concat $ replicate n s

printSubNode :: Int -> Node Text -> Text
printSubNode level (Leaf x) = T.append (stringReplicate level tab) x
printSubNode level (Branch startSymbol endSymbol subNodes) = T.intercalate "\n"
    [ T.append (stringReplicate level tab) startSymbol
    , T.intercalate "\n" (map (printSubNode (level + 1)) subNodes)
    , T.append (stringReplicate level tab) endSymbol
    ]

printNode :: Node Text -> Text
printNode (Leaf x) = x
printNode (Branch startSymbol endSymbol subNodes) = T.intercalate "\n"
    [ startSymbol
    , T.intercalate "\n" (map (printSubNode 0) subNodes)
    , endSymbol
    ]


getEndSymbol :: Text -> Maybe Text
getEndSymbol start = case filter (\(x, _) -> x == start) pairs of
    [(_, end)] -> Just end
    _          -> Nothing

parseLeaf :: [Text] -> Parser (Node Text)
parseLeaf delimiters = do
    contents <- A.takeTill isDelimiter
    return $ Leaf contents
    where
        isDelimiter c = T.singleton c `elem` delimiters ++ map fst pairs

parseBranch :: Text -> Text -> Parser (Node Text)
parseBranch start end = do
    nodes <- A.manyTill (parseNode [end]) (A.string end)
    return $ Branch start end nodes

parseNode :: [Text] -> Parser (Node Text)
parseNode delimiters = do
    -- FIXME: this means no multi-char start or end symbols
    c <- A.peekChar'
    case getEndSymbol $ T.singleton c of
        Just e -> A.anyChar >> parseBranch (T.singleton c) e
        _      -> parseLeaf delimiters

parseNodes :: Parser [Node Text]
parseNodes = many (parseNode [])


main :: IO ()
main = do
    input <- TIO.getContents
    case A.parseOnly parseNodes input of
        -- TODO: what is reasonable to do if parsing fails?
        Left _      -> undefined
        Right nodes -> TIO.putStrLn $ printNode $ Branch "" "" nodes
