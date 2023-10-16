-module(day1).

-author("jjm").

-export([get_row/1]).

-spec get_row(RowIndex :: integer()) -> [integer()].
get_row(RowIndex) ->
  % io:format("seq ~p  ~n", [RowIndex]),
  N = seq_loop(RowIndex, [1]),
  % io:format("N ~p  ~n", [N]),
  N.

seq_loop(N, L) when N >= 1 ->
  L1 = [0]++L,
  L2 = L++[0],
  L3 = lists:zip(L1, L2),
  
  T = [X+Y || {X,Y} <- L3],
  seq_loop(N - 1, T);
seq_loop(0, L) ->
  L.
