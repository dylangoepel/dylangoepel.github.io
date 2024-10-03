```haskell
-- the term type of untyped lambda calculus with debrujin indices
data Term = Appl Term Term | Fn Term | Var Int
    deriving (Show, Eq)
-- substitute the n-th debrujin index (at the top level) with a term
sub :: Int -> Term -> Term
sub n t (Var m)
    | n == m = t
    | otherwise = Var m
sub n t (Appl f x) = Appl (sub n t f) (sub n t x)
sub n t (Fn f) = Fn $ sub (n + 1) f
-- compute the beta-normal form of a term
beta :: Term -> Term
beta (Appl f x) = case beta f of
    Fn t -> beta $ sub 0 (beta x) t
    bf -> Appl bf (beta x)
beta (Fn f) = Fn (beta f)
beta (Var n) = Var n
