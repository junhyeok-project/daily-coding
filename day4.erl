-module(day4).

-author("jjm").

-export([is_power_of_four/1, is_power_of_four2/1,integer_break/1]).

-spec is_power_of_four(N :: integer()) -> boolean().
is_power_of_four(1) ->
  true;
is_power_of_four(N) when N =< 0 ->
  false;
is_power_of_four(N) ->
  case N rem 4 of
    0 ->
      is_power_of_four(N div 4);
    _ ->
      false
  end.

-spec is_power_of_four2(N :: integer()) -> boolean().
is_power_of_four2(N) ->
  % (N > 0)  and (N band 16#5555_5555 == N).
  (N > 0) and (N band (N - 1) == 0) and (N band 16#5555_5555 == N).


-spec integer_break(N :: integer()) -> integer().
integer_break(N) ->
  L = lists:seq(2, N),
  io:format("seq ~p  ~n", [L]),
  L.
