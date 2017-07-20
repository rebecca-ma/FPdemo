-module(demo).
-export([add/2,
         multiply/2,
         divide/2,
         arithmetic/3,
         recursive_sum/1,
         by_two/1,
         compose/2,
         do_arithmetic/3,
         maybe_divide/2,
         maybe_multiply/2,
         maybe_add/2]).
-import(maybe, [map2/3, return/1]).


add(X, Y) ->
    X + Y.

multiply(X, Y) ->
    X * Y.

divide(X, Y) ->
    X / Y.

arithmetic(add, X, Y) ->
    add(X, Y);
arithmetic(subtract, X, Y) ->
    X - Y;
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


maybe_divide(_, 0) ->
    return(undefined);
maybe_divide(X, Y) ->
    map2(fun divide/2, X, Y).

maybe_multiply(X, Y) ->
    map2(fun multiply/2, X, Y).

maybe_add(X, Y) ->
    map2(fun add/2, X, Y).
