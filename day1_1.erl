-module(day1_1).

-author("jjm").

% 2849
-export([is_reachable_at_time/5]).

-spec is_reachable_at_time(Sx :: integer(),
                           Sy :: integer(),
                           Fx :: integer(),
                           Fy :: integer(),
                           T :: integer()) ->
                              boolean().
                            is_reachable_at_time(Sx, Sy, Fx, Fy, T) ->
                                X = abs(Fx - Sx),
                                Y = abs(Fy - Sy),
                                Max = max(X, Y),
                                % Min = min(X, Y),
                                Result =
                                    case Max =:= 0 of
                                        true ->
                                            (T >= 2) or (T =:=0);
                                        _ ->
                                        Max =< T
                                    end,
                                Result.
