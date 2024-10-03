---
title: dylangoepel.de
---

# linearly decomposable maps as a precursor to the cayley-hamilton theorem
let $a \in \operatorname{Hom}_K(K^n, K^n)$, $K^n = \sum_{i = 1}^m U_i$, $U_i \cap U_j = \{0\}$
for $i \not= j$ and $a(U_i) \subseteq U_i$ for all $1 \leq i \leq m$.
as our $U_i$ must be finite dimensional, we can now choose ordered bases
$B_i$ for all $U_i$ and construct the ordered base $B = B_1, \ldots, B_n$ of $K^n$,
which yields
$$
    {_{B}(a)_{B}} = \begin{pmatrix}
        {_{B_1}(a_{\mid U_1})_{B_1}} & & \\
        & \ddots & \\
        & & {_{B_m}(a_{\mid U_m})_{B_m}}
    \end{pmatrix}.
$$
for $p \in K[x]$ we have
$$
    {_{B}(p(a))_{B}} = \begin{pmatrix}
        p\left({_{B_1}(a_{\mid U_1})_{B_1}}\right) & & \\
        & \ddots & \\
        & & p\left({_{B_m}(a_{\mid U_m})_{B_m}}\right)
    \end{pmatrix}
$$
and thus
$$
    \det (p(a)) = \prod_{i = 1}^m \det(p(a_{\mid U_i})).
$$
we can now substitute $K = Q(K[y])$, $p = y - x \in K[y][x] \subseteq Q(K[y])[x]$
and get
$$
    \operatorname{chpol}(a) = \prod_{i = 1}^m \operatorname{chpol}(a_{\mid U_i}).
$$
also, we have $p(a) = 0$ if and only if $p(a_{\mid U_i}) = 0$ for all $1 \leq i \leq m$
and thus
$$
    \operatorname{minpol}(a) = \operatorname{lcm}(\operatorname{minpol}(a_{\mid U_1}), \ldots, \operatorname{minpol}(a_{\mid U_m})).
$$
we have now reduced the problem of proving that $\operatorname{minpol}(a) \mid \operatorname{chpol}(a)$
to proving that $\operatorname{minpol}(a_{\mid U_i}) \mid \operatorname{chpol}(a_{\mid U_i})$ for all smaller
linear maps $a_{\mid U_i}$.

# $\beta$-normal form in untyped debrujin-coded $\lambda$-calculus using pattern matching
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
```
