-module(day1_0).

-author("jjm").

-export([sort_by_bits/1, poor_pigs/3]).

-spec sort_by_bits(Arr :: [integer()]) -> [integer()].
sort_by_bits(Arr) ->
    Arr2 = lists:sort(Arr),
    % io:format("Arr2 ~p  ~n", [Arr2]),
    solution(Arr2, 0, []).

solution([], 0, _) ->
    [0];
solution([], _, Result) ->
    Result;
solution(T, N, Result) ->
    % io:format("solution ~p  ~n", [T]),
    Fun = fun(XX) ->
             %  io:format("integer_to_list(XX, 2) ~p  ~n", [integer_to_list(XX, 2)]),
             %  io:format("L ~p  ~n", [L]),
             L = lists:map(fun(X) -> X - 48 end, integer_to_list(XX, 2)),
             lists:sum(L)
          end,
    T1 = [X || X <- T, Fun(X) == N],
    % io:format("solution1 ~p  ~n", [T]),
    solution(lists:subtract(T, T1), N + 1, Result ++ T1).
    
% https://leetcode.com/problems/poor-pigs/solutions/94278/Very-Clear-Explanation-by-Short-Examples/
-spec poor_pigs(Buckets :: integer(),
                MinutesToDie :: integer(),
                MinutesToTest :: integer()) ->
                   integer().
poor_pigs(N, _, _) when N < 2 ->
    0;
poor_pigs(N, MinutesToDie, MinutesToTest) ->
    Count = MinutesToTest div MinutesToDie,
    io:format("Count ~p  ~n", [Count]),
    PigCount = pig_solution(N, 1, Count),
    PigCount.

pig_solution(BucketsCount, Pig, Count) ->
    case BucketsCount =< math:pow(Count + 1, Pig) of
        true ->
            Pig;
        _ ->
            pig_solution(BucketsCount, Pig + 1, Count)
    end.
