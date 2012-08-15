-module(soap_test_service).
-compile({parse_transform, durden_pt}).

-include_lib("durden/include/predefined_types.hrl").

-soap_target_ns("http://rgafiyatullin.github.com/test-service").
-soap_service_name("TestService").

-soap_actions(['GetUserByID'/1]).

-type phone_numbers() :: [ string() ].

-record('User', {
	'ID' :: uuid(),
	'Name' :: string(),
	'YearOfBirth' :: integer(),
	'Phones' :: phone_numbers()
	}).

-spec 'GetUserByID'( ID :: uuid() ) -> #'User'{}.
'GetUserByID'( ID ) ->
	#'User'{
		'ID' = ID,
		'Name' = "Test User",
		'YearOfBirth' = 1988,
		'Phones' = ["+375005550000", "+375115550000"]
	}.