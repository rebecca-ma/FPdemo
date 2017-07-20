-module(maybe).
-export([return/1, map/2, map2/3, join/1]).

return(undefined) ->
    undefined;
return(Val) ->
    {just, Val}.


map(Function, {just, Val}) ->
    map(Function, Val);
map(_, undefined) ->
    undefined;
map(Function, Val) ->
    return(Function(Val)).


map2(_, undefined, _) ->
    undefined;
map2(Function, Val1, Val2) ->
    map(fun (Val) -> Function(Val1, Val) end, Val2).


join({just, Val}) ->
    Val;
join(undefined) ->
    undefined.
