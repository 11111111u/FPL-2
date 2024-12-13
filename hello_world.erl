-module(hello_world).
-export([start/0]).

start() ->
    io:format("Hello, world!~n").

% c(hello_world).
% hello_word:start().
