-module(demo).
-export([add/2, subtract/2, multiply/2, arithmetic/3, recursive_sum/1,
    by_two/1, compose/2,
    do_arithmetic/3]).

add(X, Y) ->
    X + Y.

subtract(X, Y) ->
    X - Y.

multiply(X, Y) ->
    X * Y.

arithmetic(add, X, Y) ->
    add(X, Y);
arithmetic(subtract, X, Y) ->
    subtract(X, Y);
arithmetic(multiply, X, Y) ->
    multiply(X, Y).

recursive_sum([X]) ->
    X;
recursive_sum([X | Y]) ->
    X + recursive_sum(Y).

do_arithmetic(F, X, Y) ->
    F(X, Y).

by_two(F) ->
    fun (Val) -> F(Val, 2) end.

compose(F, G) ->
    fun (X) -> F(G(X)) end.
