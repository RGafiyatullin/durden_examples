-module(durden_examples_sup).
-behaviour(supervisor).

-export([start_link/0]).
-export([init/1]).

start_link() ->
	supervisor:start_link({local, ?MODULE}, ?MODULE, {}).

init({}) ->
	{ok,
		{
			{one_for_one, 5, 30},
			[
				{uuid, {uuid, start_link, []}, permanent, 10000, worker, [uuid]},
				{kyte_pool, {phone_book_kyte_pool, start_link, []}, permanent, 10000, worker, [phone_book_kyte_pool]},
				{pb_trees, {phone_book_soap_db, start_link, [pb_trees]}, permanent, 5000, worker, [phone_book_soap_db]},
				{pb_leaves, {phone_book_soap_db, start_link, [pb_leaves]}, permanent, 5000, worker, [phone_book_soap_db]}
			]
		}
	}.
