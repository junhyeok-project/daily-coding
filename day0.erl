-module(day0).

-author("jjm").

-export([two_sum/2]).

-spec two_sum(Nums :: [integer()], Target :: integer()) -> [integer()].
two_sum(Nums, Target) ->
  L = lists:seq(0, length(Nums) - 1),
  % io:format("seq ~p  ~n", [L]),
  N = lists:zip(L, Nums),
  % io:format("zip ~p ~n", [N]),
  % io:format("zip2 ~p ~n", [N -- [{0, 1}]]),
  % io:format("zip3 ~p ~n", [N]),
  Ti = [[Xi, Yi] || {Xi, X} <- N, {Yi, Y} <- N -- [{Xi, X}], X + Y == Target],
  hd(Ti).
