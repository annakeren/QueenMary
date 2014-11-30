-- Functional Programming Week 2

-- this is a comment

{- this is a multiline
nested comment 
{- with two layers
of nesting -}
-}

-- Haskell programs contain equations declaring identifiers
x = 4  -- and this is another comment

-- The order in which different identifiers are declared does not matter
-- We can declare y depending on z
y=z
-- and only later declare 
z=3
-- load this with :l and test y

-- But we must declare the z somewhere (uncomment this and reload)
-- should get error: week02.hs:21:5: Not in scope: `v'
-- u = v

-- And you can't declare stuff twice (uncomment this and reload)
-- z=4

-- Simple form of declaration
-- <FunctionName> <pattern(s)> = <expression>

foo x = x+4

lplus x (y:ys) = x+y

threeplus x y z = x+y+z

-- But the clauses for each declaration have to be together
-- lplus x [] = x

-- And you can't use the same variable more than once in the pattern part of 
-- a declaration

-- fourplus x x y z = 0

-- but you can in different clauses
nlplus [] = 0
nlplus [x] = x
nlplus (x:y:ys) = x+y

-- Haskell uses the off-side rule, definitions can go over more than one line: 
goo x = if x<=0 then 0 else x*x
        
-- note that you need the else clause. Try commenting it out, or moving it to the left. 

-- HASKELL TYPES

-- We can also make type declarations
type MyString = [Char]
-- declares MyString as a synonym for [Char] (String already is...)

-- More interestingly
data Name = Name String
            deriving Show
-- the last line is just so we can print stuff to screen, try commenting it out

-- or 
data MyBtree = Node [Char] MyBtree MyBtree | Leaf [Char] | Empty
                deriving Show
                
btreeExample = Node "a" 
                  (Node "b" (Leaf "c")  Empty)
                  (Node "d" (Node "e" (Leaf "f") (Leaf "g")) Empty)

-- simple pattern match on defined type                  
nameLength (Name s) = length s

-- more complex pattern matches on defined type
top (Node s _ _) = s
top (Leaf s) = s
top Empty = ""

list (Node s l r) = s ++ (list l) ++ (list r)
list (Leaf s) = s
list (Empty) = ""
                   
-- Example of monomorphic equivalents of pairs and lists
data IntChar = IntCharPair Int Char
               deriving Show

data IntList = IntNil | IntCons  Int IntList
               deriving Show       
                           
                              
data Pair a b = MkPair a b 
                 deriving Show
                 
data MyList a = Nil | Cons a (MyList a)

myLength Nil = 0
myLength (Cons a as) = 1 + (myLength as)

myLength' x = case x of { Nil -> 0 ; Cons a as -> 1+myLength' (as) }

myLength'' = \ x -> case x of { Nil -> 0 ; Cons a as -> 1+myLength'' (as) }
        
tL = Cons 1 (Cons 2 Nil)

area x = let { pi = 3.14; xsq = x*x } in pi* xsq

fib x | x >= 1 = fib (x-1) + fib (x-2)
      | otherwise = 1
