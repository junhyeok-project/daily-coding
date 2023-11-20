-module(reloading).

-author("jjm").

-export([loop/0]).

loop() ->
    receive
        upgrade ->
            code:purge(?MODULE),
            compile:file(?MODULE),
            code:load_file(?MODULE),
            ?MODULE:loop();
        hello ->
          io:format("hello!~n"),
          loop();
        _ ->
            loop()
    end.

