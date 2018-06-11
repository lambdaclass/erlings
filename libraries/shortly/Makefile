.PHONY: default server samples test

default:
	@echo "usage [test|server]"

server:
	./rebar3 shell --apps shortly

test:
	./rebar3 eunit
	./rebar3 ct
	echo "ALL TESTS PASSED"

node_8010:
	./rebar3 shell --apps shortly --config src/config/node_8010.config --sname node_8010

node_8020:
	./rebar3 shell --apps shortly --config src/config/node_8020.config --sname node_8020
