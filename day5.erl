-module(day5).

% _515
-author("jjm").

-export([largest_values/1]).

%% Definition for a binary tree node.
%%
-record(tree_node,
        {val = 0 :: integer(),
         left = null :: null | #tree_node{},
         right = null :: null | #tree_node{}}).

-spec largest_values(Root :: #tree_node{} | null) -> [integer()].
largest_values({tree_node, N, null, null}) ->
  [N];
largest_values([]) ->
  [];
largest_values(null) ->
  [];
largest_values(Root) ->
  {tree_node, N, L, R} = Root,
  T = [L, R],
  % Count = length(lists:filter(fun(Y) -> Y =:= null end, T)),
  Result = loop_node(T, [N]),
  Result.

loop_node([], Result) ->
  Result;
loop_node(NodeList, Result) ->
  io:format("NodeList ~p ~p  ~n", [NodeList,Result]),
  {NextList, Max} = loop_convert(NodeList, [], -576460752303423489),
  io:format("NextList ~p ~p  ~n", [NextList,Max]),

  case Max of
    -576460752303423489 ->
      loop_node(NextList, Result);
    _ ->
      loop_node(NextList, Result ++ [Max])
  end.

loop_convert([], NextList, Max) ->
  {NextList, Max};
loop_convert([null | T], NextList, Max) ->
  loop_convert(T, NextList, Max);
loop_convert([{tree_node, N, L, R} | T], NextList, Max) ->
  loop_convert(T, NextList ++ [L] ++ [R], max(N, Max)).

% -spec largest_values_int(Nums :: [integer()]) -> [integer()].
% largest_values_int(Nums) ->
%   A = case Nums of
%         [] ->
%           [0];
%         [N] ->
%           [N];
%         [N | _] ->
%           largest_values_int(Nums, 1, [N])
%       end,
%   A.

% largest_values_int([], _, Result) ->
%   Result;
% largest_values_int(Nums, K, Result) ->
%   Count = math:pow(2, K),
%   {A, B} = lists:split(Count, Nums),
%   largest_values_int(B, K + 1, [Result | lists:max(A)]).
