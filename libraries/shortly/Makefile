.PHONY: default server samples test

default:
	@echo "usage [test|server]"

server:
	./rebar3 shell --apps shortly

test:
	./rebar3 eunit
	./rebar3 ct
