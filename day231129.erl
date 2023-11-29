-module(day231129).

-author("jjm").

-export([number_of_ways/1]).

-spec number_of_ways(Corridor :: unicode:unicode_binary()) -> integer().
% S 83
% P 80
number_of_ways(Corridor) ->
  
io:format("test ~p  ~n", [print_gg()]),
  io:format("Corridor ~p  ~n", [Corridor]),
  io:format("len(Corridor) ~p  ~n", [length(Corridor)]),
  _ = lists:filter(fun(Y) -> Y == 83 end, Corridor),
  Result = [Y || Y <- Corridor, Y == 83],
  Result.

% print_temp(Temp) ->
%   io:format("print_temp ~p  ~n", [Temp]),
%   Temp.

  print_gg() ->
    maybe
      {ok, A} ?= test("T"),
      true = A == "T",
      {ok, B} ?= test("W"),
      A++B
    else
    error -> error
end.
test(A)->
  io:format("test ~p  ~n", [A]),
{ok,A}.