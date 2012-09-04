-module(phone_book_soap_db).
-export([start_link/1]).

-include_lib("kyte/include/kyte.hrl").

start_link(RegName) ->
	DbArgs = #kyte_db_args{
		file = "data/" ++ atom_to_list(RegName) ++ ".kch",
		key_codec = etf,
		val_codec = etfz
	},
	{ok, Db} = kyte:db_open(phone_book_kyte_pool, DbArgs),
	erlang:register(RegName, Db),
	{ok, Db}.

