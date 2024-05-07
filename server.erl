-module(server).
-export([start/1]).

start(Port) ->
    spawn(fun () -> {ok, Sock} = gen_tcp:listen(Port, [{active, false}]), 
                    loop(Sock) end).

loop(Sock) ->
    {ok, Conn} = gen_tcp:accept(Sock),
    Handler = spawn(fun () -> handle(Conn) end),
    gen_tcp:controlling_process(Conn, Handler),
    loop(Sock).

handle(Conn) ->
    {ok,Packet}=gen_tcp:recv(Conn, 0),
    gen_tcp:send(Conn, response(Packet)),
    gen_tcp:close(Conn).

response(Str) ->
    B = iolist_to_binary(Str),
    
    io:format("response ~p  ~n", [B]),
    iolist_to_binary(
      io_lib:fwrite(
         "HTTP/1.0 200 OK\nContent-Type: text/html\nContent-Length: ~p\n\n~s",
         [size(B), B])).