-module(phone_book_soap).
-compile({parse_transform, durden_pt}).

-include_lib("durden/include/predefined_types.hrl").

-soap_target_ns("http://rgafiyatullin.github.com/phone-book/v0").
-soap_service_name("PhoneBookAPI").

-soap_actions(['PBCreate'/0]).
-soap_actions(['TreeGetDeep'/1]).

-define(db_t, pb_trees).
-define(db_l, pb_leaves).

-record('PBLeaf', {
		'DisplayName' :: string()
	}).
-record('PBTree', {
		'ID' :: uuid(),
		'Groups' :: [ #'PBTree'{} ],
		'Items' :: [ #'PBLeaf'{} ]
	}).

-spec 'PBCreate'() -> uuid().
'PBCreate'() ->
	PBID = uuid:to_string(uuid:newid()),
	io:format("Creating ID: ~p~n", [PBID]),
	kyte:db_set(?db_t, PBID, tree_new(PBID) ),
	PBID.

-spec 'TreeGetDeep'( ID :: uuid() ) -> #'PBTree'{}.
'TreeGetDeep'( ID ) ->
	io:format("Fetching ID: ~p~n", [ID]),
	get_tree_deep( ID ).

%%% Internal

get_tree( ID ) ->
	{ok, Tree} = kyte:db_get(?db_t, ID),
	Tree.

get_tree_deep( ID ) ->
	Tree = get_tree( ID ),
	Tree #'PBTree' {
		'Groups' = lists:map(
			fun(SubID) ->
				get_tree_deep( SubID )
			end,
			Tree #'PBTree'.'Groups'
		)
	}.

tree_new(ID) ->
	#'PBTree'{
		'ID' = ID,
		'Groups' = [],
		'Items' = []
	}.
