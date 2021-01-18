data Branching a = Element a | Branch ( Branching a) ( Branching a)

myterm = Branch ( Element 7) ( Branch ( Element 8) ( Element 14) )


count :: Branching a -> Integer
count (Branch left right) = count left + count right 
count (Element element)   = 1

-- bingo :: [Ordering] -> Ordering -> [Ordering]
bingo (x:xs) y = if x == y then xs else x : ( bingo xs y)
bingo [] y = []



relegate :: Eq t => [t] -> [t]
relegate []     = []
relegate (x:xs) =  relegateHelper xs x

relegateHelper :: Eq t => [t] -> t -> [t]
relegateHelper (x:xs) y = if x == y then relegateHelper xs y ++ [x] else x : relegateHelper xs y
relegateHelper [] y = [y]


areTheyTheSame :: (Eq a, Num p) => (a, a) -> p
areTheyTheSame (a, b) = if a == b then 1 else 0

fib n = head (drop (n-1) (fibs 1 1))
        where
            fibs a b = a : (fibs b (a+b))

evens = [2 * i | i <- [1..]]