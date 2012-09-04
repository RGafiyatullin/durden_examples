-module(t).
-compile(export_all).
-include_lib("xmerl/include/xmerl.hrl").

start() ->
	Dispatch = [
		%% {Host, list({Path, Handler, Opts})}
		{'_', [
			{[<<"test">>, <<"service.asmx">>, '...'], soap_test_service, [ "http://localhost:8080/test/service.asmx" ] },
			{[<<"pb">>, <<"v0.asmx">>, '...'], phone_book_soap, [ "http://localhost:8080/pb/v0.asmx" ] }
		]}
	],
	cowboy:start_listener(my_http_listener, 100,
		cowboy_tcp_transport, [{port, 8080}],
		cowboy_http_protocol, [{dispatch, Dispatch}]
	).
