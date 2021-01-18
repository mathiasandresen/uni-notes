-- Problem 1

type Var = String

data SimpleType = IntType |  SimpleType :*: SimpleType |  SimpleType :->: SimpleType deriving (Eq,Show)


var myIntInt = IntType :->: IntType

-- Problem 2

data Term = Cons Int | VarTerm Var | Pair Term Term | App Term Term | Abs Var SimpleType Term deriving (Eq,Show)

myTerm = (Abs "x" (IntType) (VarTerm "x"))

-- Problem 3

member x (y:ys) = (x == y) || (member x ys)
member x [] = False

union [] ys = ys
union (x:xs) ys = if (member x ys) then union xs ys else x:(union xs ys)

minus (x:xs) y = if (x == y) then xs else x:(minus xs y)

fv (Cons n) = []
fv (VarTerm x) = [ x ]
fv (Pair e1 e2) = (fv e1) `union` (fv e2)
fv (App e1 e2) = (fv e1) `union` (fv e2)
fv (Abs x t e) = (fv e) `minus` x

closed e = ((fv e) == [])

-- Problem 4

lookupType x [] = Nothing
lookupType x ((y,t):env1) = if x == y then (Just t) else lookupType x env1

upd (x,t) [] = [(x,t)]
upd (x,t) ((y,t1):env1) = if (x==y) then ((x,t):env1) else (y,t1):(upd (x,t) env1)

-- Problem 5

findtype (Cons n) env  = Just IntType
findtype (VarTerm x) env  = let v = lookupType x env
                             in
                               case v of
                                Nothing -> Nothing
                                Just x -> v
findtype (Pair e1 e2) env =
                 let t1 = findtype e1 env
                     t2 = findtype e2 env
                 in
                     case t1 of
                          Nothing -> Nothing
                          Just x ->
                               case t2 of
                                    Nothing -> Nothing
                                    Just y -> Just (x :*: y)
findtype (App e1 e2) env =
                 let t1 = findtype e1 env
                     t2 = findtype e2 env
                 in
                     case t1 of
                          Nothing -> Nothing
                          Just (t11 :->: t12)  ->                          
                               case t2 of
                                    Nothing -> Nothing
                                    Just y -> if (y == t11) then Just t12 else Nothing
findtype (Abs v t1 e) env =
                  let env1 = upd (v,t1) env
                      t2 = findtype e env1
                  in
                      case t2 of
                                Nothing -> Nothing
                                Just t22 -> Just (t1 :->: t22)