
all: generate

get-deps:
	@./rebar get-deps

clean:
	@./rebar clean

dialyze:
	@./rebar clean
	@./rebar compile debug_info=1
	@./rebar dialyze skip_deps=true
	@./rebar clean

build-plt:
	@./rebar build-plt skip_deps=true

compile: get-deps
	@./rebar compile

generate: compile
	@rm -rf examples/examples
	@./rebar generate

console:
	./examples/examples/bin/examples console
