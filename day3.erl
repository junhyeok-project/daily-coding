-module(day3).

-author("jjm").

-export([maximum_score/2]).

-spec maximum_score(Nums :: [integer()], K :: integer()) -> integer().
maximum_score(Nums, K) ->
  {L, R} = {K, K},
  Min =
    lists:min(
      lists:sublist(Nums, L + 1, 1)),
  {ok, Result} = find_best(no, Nums, Min, 0, L, R),
  Result.  % Len = length(Nums),

find_best(ok, _, _, Max, _, _) ->
  {ok, Max};
find_best(_, Nums, Min, Max, L, R) ->
  io:format(" L, R ~p ~p ~p ~p  ~n", [Min, Max, L, R]),
  if (L =< 0) and (R >= length(Nums) - 1) ->
       Min2 =
         min(Min,
             lists:min(
               lists:sublist(Nums, L + 1, R - L + 1))),
       Max2 = max(Max, Min * (R - L + 1)),
       find_best(ok, Nums, Min2, Max2, L, R);
     true ->
       if L =< 0 ->
            Min2 =
              min(Min,
                  lists:min(
                    lists:sublist(Nums, L + 1, R - L + 1 + 1))),
            Max2 = max(Max, Min2 * (R - L + 1)),
            find_best(more, Nums, Min2, Max2, L, R + 1);
          R >= length(Nums) - 1 ->
            Min2 =
              min(Min,
                  lists:min(
                    lists:sublist(Nums, L, R - L + 1 + 1))),
            Max2 = max(Max, Min2 * (R - L + 1)),
            find_best(more, Nums, Min2, Max2, L - 1, R);
          true ->
            Temp =
              lists:min(
                lists:sublist(Nums, L + 1, R - L + 1))
              > lists:min(
                  lists:sublist(Nums, L - 1, R - L + 1)),
            if Temp ->
                 io:format("여기¸1.0 L, R ~p ~p ~p ~p  ~n", [Min, Max, L, R]),
                 Min2 =
                   min(Min,
                       lists:min(
                         lists:sublist(Nums, L+1, R - L + 1 + 1))),
                 Max2 = max(Max, Min2 * (R - L + 1+1)),

                 io:format("여기1.1 L, R ~p ~p ~p ~p  ~n", [Min2, Max2, L, R]),
                 find_best(more, Nums, Min2, Max2, L, R + 1);
               true ->
                 io:format("여기2 L, R ~p ~p ~p ~p  ~n", [Min, Max, L, R]),
                 Min2 =
                   min(Min,
                       lists:min(
                         lists:sublist(Nums, L , R - L + 1 + 1))),
                 Max2 = max(Max, Min2 * (R - L + 1+1)),

                 find_best(more, Nums, Min2, Max2, L - 1, R)
            end
       end
  end.
