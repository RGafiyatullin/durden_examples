-module(durden_examples_app).
-behaviour(application).
-export([start/2, stop/1]).

-spec start(normal, [term()]) -> {ok, pid()}.
start(normal, _Args) ->
	durden_examples_sup:start_link().

-spec stop(term()) -> ignore.
stop(_) -> ignore.
