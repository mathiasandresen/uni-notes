-- Mathias Andresen - mandr17@student.aau.dk
-- Mads-Bo Lassen   - mlass17@student.aau.dk

import Data.Map (Map, empty, insert, lookup, toList, union, singleton)
import Data.Maybe (isNothing, fromMaybe, fromJust)
import Data.List (sortBy)

-- Datatype representing a node in a Huffman Tree
data HuffmanNode = 
      Leaf Int Char 
    | Node Int HuffmanNode HuffmanNode deriving (Show)

main = do
    putStrLn "--Enter string to encode and decode"  
    message <- getLine
    let tree = computeHuffmanTreeFromString message
    putStrLn "--This is the tree:"
    print tree
    let encoded = huffmanEncode message
    putStrLn "--This is the encoded text:"
    putStrLn encoded
    putStrLn "--This is the decoded text:"
    putStrLn (huffmanDecode encoded tree)

-- Encode a string
huffmanEncode :: String -> String
huffmanEncode message = concatMap (\ c -> fromJust (Data.Map.lookup c huffmanMap)) message
    where huffmanMap = huffmanTreeToMap (computeHuffmanTreeFromString message)

-- Decode a string using a specified huffman tree
huffmanDecode :: String -> HuffmanNode -> String 
huffmanDecode toDecode tree = huffmanDecodeLoop [] toDecode tree tree

-- Helper method for function above
-- Looks at a single "bit" at a time and walks the tree accordingly. When it reaches a leaf, it is added to the result and the travesel restarts from the top
huffmanDecodeLoop :: String -> String -> HuffmanNode -> HuffmanNode -> String 
huffmanDecodeLoop result (x:xs) root (Node _ lChild rChild)
    | x == '0' = huffmanDecodeLoop result xs root lChild
    | x == '1' = huffmanDecodeLoop result xs root rChild
huffmanDecodeLoop result (x:xs) root (Leaf _ char) = 
    huffmanDecodeLoop (result ++ [char]) (x:xs) root root
huffmanDecodeLoop result [] root node = result ++ [leafChar node]


-- Standard functions for getting values from different types of nodes
nodeValue :: HuffmanNode -> Int
nodeValue (Leaf val _) = val
nodeValue (Node val _ _) = val

leafChar :: HuffmanNode -> Char
leafChar (Leaf _ val) = val

leftChild :: HuffmanNode -> HuffmanNode
leftChild (Node _ child _) = child

rightChild :: HuffmanNode -> HuffmanNode
rightChild (Node _ _ child) = child


-- Compute a huffman tree from a string
computeHuffmanTreeFromString :: String -> HuffmanNode
computeHuffmanTreeFromString message = buildHuffmanTree (occurrencesToNodes (countCharOccurrence message))

-- Convert huffman tree to map, to be used by encoder
huffmanTreeToMap :: HuffmanNode -> Map Char String
huffmanTreeToMap node = huffmanTreeToMapLoop node []

-- Helper method for function above
huffmanTreeToMapLoop :: HuffmanNode -> String -> Map Char String
huffmanTreeToMapLoop (Node _ lChild rChild) string = Data.Map.union mapLeft mapRight
    where
        mapLeft  = huffmanTreeToMapLoop lChild (string ++ "0")
        mapRight = huffmanTreeToMapLoop rChild (string ++ "1")
huffmanTreeToMapLoop (Leaf _ char) string = Data.Map.singleton char string

-- Build huffman tree from a list of nodes
buildHuffmanTree :: [HuffmanNode] -> HuffmanNode
buildHuffmanTree nodes
    | length nodes == 1 = head nodes
    | otherwise         = 
        buildHuffmanTree (drop 2 (insertNode 0 (combineNodes (head nodes) (nodes !! 1)) nodes))

-- Insert a node at the correct place in the list of huffman nodes
insertNode :: Int -> HuffmanNode -> [HuffmanNode] -> [HuffmanNode]
insertNode index node nodes
    | index <= 0 = 
        insertNode 1 node nodes
    | nodeValue (nodes !! (index - 1)) >= nodeValue node = 
        let (ys,zs) = splitAt (index - 1) nodes in ys ++ [node] ++ zs
    | index >= length nodes =
        nodes ++ [node]
    | otherwise     = 
        insertNode (index + 1) node nodes

-- Combine 2 nodes into one node
combineNodes :: HuffmanNode -> HuffmanNode -> HuffmanNode
combineNodes nodeA nodeB = Node (nodeValue nodeA + nodeValue nodeB) nodeA nodeB

-- Create huffman nodes from a list of char occurrences
occurrencesToNodes :: [(Char, Int)] -> [HuffmanNode]
occurrencesToNodes = map (\ x -> Leaf (snd x) (fst x))

-- Compare function for function above
compareOccurrences :: (Char, Int) -> (Char, Int) -> Ordering
compareOccurrences (k1, v1) (k2, v2)
    | v1 > v2 = GT
    | v1 < v2 = LT
    | v1 == v2 = compare k1 k2

-- Count number of char ocurrences
countCharOccurrence :: String -> [(Char, Int)]
countCharOccurrence message = 
    sortBy compareOccurrences (toList (countCharOccurrenceLoop message empty))

-- Helper for function above
countCharOccurrenceLoop :: String -> Map Char Int -> Map Char Int
countCharOccurrenceLoop [] map = map
countCharOccurrenceLoop (x:xs) map
    | isNothing entry = countCharOccurrenceLoop xs (insert x 1 map)
    | otherwise       = countCharOccurrenceLoop xs (insert x (fromJust entry + 1) map)
    where
        entry = Data.Map.lookup x map

-- Used for testing
string = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
tree = computeHuffmanTreeFromString string
encoded = huffmanEncode string


