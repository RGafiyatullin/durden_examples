-module(t).
-compile(export_all).
-include_lib("xmerl/include/xmerl.hrl").

test() ->
	durden_wsdl:module_wsdl("http://localhost:8080/test/service.asmx", soap_test_service).

start() ->
	Dispatch = [
		%% {Host, list({Path, Handler, Opts})}
		{'_', [{[<<"test">>, <<"service.asmx">>, '...'], soap_test_service, [] }]}
	],
	cowboy:start_listener(my_http_listener, 100,
		cowboy_tcp_transport, [{port, 8080}],
		cowboy_http_protocol, [{dispatch, Dispatch}]
	).
