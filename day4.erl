-module(day4).

-author("jjm").

-export([is_power_of_four/1]).

-spec is_power_of_four(N :: integer()) -> boolean().
is_power_of_four(1) ->
  true;  
is_power_of_four(N) when N =< 0 ->
  false;
is_power_of_four(N) ->
  case N rem 4 of
    0 -> is_power_of_four(N div 4);
    _ -> false
end.
