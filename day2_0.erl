-module(day2_0).

-author("jjm").

% 2849
-export([garbage_collection/2]).

-spec garbage_collection(Garbage :: [unicode:unicode_binary()], Travel :: [integer()]) ->
                          integer().
garbage_collection(Garbages, Travel) ->
  io:format("Garbages ~p ~n Travel ~p  ~n", [Garbages, Travel]),
  L = lists:zip(Garbages, [0] ++ Travel),
  RL = lists:reverse(L),
  io:format("RL ~p ~n ", [RL]),

  FindList = [{Y, findGPM(X)} || {X, Y} <- RL],
  SumResult = [R || {_, {_, R}} <- FindList],
  Result = [{Y, {G, P, M}} || {Y, {{G, P, M}, _}} <- FindList],
  io:format("SumResult ~p ~n ", [lists:sum(SumResult)]),
  io:format("Result ~p ~n ", [Result]),
  findValue(Result, lists:sum(SumResult)).

  % SumResult+Result.
  % lists:sum(SumResult),
  % ok.

findValue([], Value) ->
  Value;
findValue([{Y, {G, P, M}}], Value) ->
  L = [G] ++ [P] ++ [M],
  Value + length(lists:filter(fun(T) -> T end, L)) * Y;
findValue([{Y, Pattern = {G, P, M}} | T], Value) ->
  L = [G] ++ [P] ++ [M],
  [{Y2, {G2, P2, M2}} | T2] = T,
  case Pattern of
    {true, true, true} ->
      Temp = {true, true, true};
    {true, true, false} ->
      Temp = {true, true, M2};
    {true, false, true} ->
      Temp = {true, P2, true};
    {true, false, false} ->
      Temp = {true, P2, M2};
    {false, true, true} ->
      Temp = {G2, true, true};
    {false, true, false} ->
      Temp = {G2, true, M2};
    {false, false, true} ->
      Temp = {G2, P2, true};
    {false, false, false} ->
      Temp = {G2, P2, M2}
  end,

  % io:format("Temp ~p ~n ", [Temp]),
  H = {Y2, Temp},
  V = length(lists:filter(fun(X) -> X end, L)) * Y,
  findValue([H] ++ T2, Value + V).

findGPM(Garbage) when is_bitstring(Garbage) ->
  findGPM(erlang:binary_to_list(Garbage));
findGPM(Garbage) ->
  FG = fun(K) -> K == 71 end,%G 71
  FP = fun(K) -> K == 80 end,%P 80
  FM = fun(K) -> K == 77 end,%M 77
  {G, GAfter} = lists:partition(FG, Garbage),
  {P, PAfter} = lists:partition(FP, GAfter),
  {M, _} = lists:partition(FM, PAfter),

  {{length(G) > 0, length(P) > 0, length(M) > 0}, length(G) + length(P) + length(M)}.
