-module(phone_book_kyte_pool).
-export([start_link/0]).

start_link() ->
	{ok, Pool} = kyte:pool_create(4),
	erlang:register(?MODULE, Pool),
	{ok, Pool}.
