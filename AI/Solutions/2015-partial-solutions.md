---
header-includes:
    - \usepackage{inconsolata}
    - \usepackage[T1]{fontenc}
    - \renewcommand{\familydefault}{\sfdefault}
    - \usepackage{tikz}
    - \usepackage{tikz-qtree}
    - \usepackage{float}
---

# Denote by $\dagger$ the basic AI problem of *an agent acting intelligently in its environment*.

## What is a Turing machine and what does it have to do with $\dagger$?
- Environment is the Tape, it needs to halt

## What is the halting problem and how does it relate to $\dagger$?
- Whether a turing machine on a particular input will halt or not
- Undecidable in general

## What is the SAT problem and how is it related to $\dagger$?
- Trying to find an assignment to the variables satisfying an expression
- Might be the task the agent is trying to complete
- Boolean expressions are a way of expressing what it's trying to complete

## What is the P vs NP problem, and how does it relate to SAT?
- Feasible computation
- Cobham's theoerm
- SAT feasible if P = NP
- N allows for non determinism


# A Simple way in Prolog to search is
```prolog
search(Node) :- goal(node).
search(Node) :- arc(Node, Next), goal(next)
```

## What is non-determinism? And how does it relate to search?
- There could be more than one `next`

## Modify this search to do:
### Bounded Depth First
*depth first to a specific depth*

```prolog
bs(Node, _) :- goal(Node).
bs(Node, s(X)) :- arc(Node, Next), bs(Next, X).
```
### Iterative Deepening
*bounded depth fist until search succeeds*
```prolog
iterSearch(Node) :- bound(Bd), bs(Node, Bd).
bound(s(x)) :- bound(x).
```

## What are the ingredients for *A Star* Search?
1. A cost on arcs
2. heuristic function on nodes indicating how close to goal node (minimum cost path to goal node)
3. Frontier search: put at head of list the node with minimal F-Value
    - $F(node) := Cost(node) + HeuristicValue(node)$

```prolog
fs([H|_]) :- goal(H).
fs([H|T]) :-
   findall(X, arc(H, X), Children),
   addToFrontier(Children, T, New),
   fs(New).
```
## What does it mean For A-Star to be admissible?
- If the search returns a solution, it returns an optimal solution (smallest cost).
- Minimal progress is made (within some epsilon), never overestimate cost.

## What are the ingredients of a Contstraint Satisfaction Problem?
1. Variables
2. Domain
3. Constraints

*  3 Color problem: Variables are nodes
*  Domain is $\{Red, Green, Blue\}^3$
    - every node can take 3 colors, Red, Green and Blue
    - $m = 3$
*  If there's an arc between nodes, the colors must be different

## What is Generate and test?
- Instantiate all of the variables before testing the constraints

```prolog
member(X1, D1).        % --
member(X2, D2).        %   | generation
...                    %   | part
member(Xn, Dn).        % --

test(X1, Xn)           % only test after instantiating
```

# Consider the knowlege base
```prolog
false :- p.
false :- a, b.
p     :- b,c.
p     :- q.
a     :- r, s.
b.
```
## What are *Integrity Constraints*?
- A rule in the KB where head is false
     - Horn clause: clause with at most 1 positive literal

\pagebreak

##  Suppose `q`, `r`, `s` were assumable. What are the conflicts? The Minimal conflicts?
Find minimal conflicts by repeated substitution

\begin{center}
\begin{figure}[H]
\begin{tikzpicture}
\Tree [.false [.{p} {b, c} {q} ]
              [.{a, b} {r, s, b} ] ]
\end{tikzpicture}
\end{figure}
\end{center}

## What's the complete knowlege assumption (CKA)?
- Only atoms that are true are ones we can prove. If we can't prove it we take it as false.

## What does non monotonicity with respect to inference systems mean?
- $KB \vdash C \implies KB \cup \{a\} \vdash C$

## What does it mean for a KB to be Consistent?
- Consistent KB $\implies$ $\exists$ a model for the knowlege base
    - Model: Interpretation where all clauses are true
