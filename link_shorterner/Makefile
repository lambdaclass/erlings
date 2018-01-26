.PHONY: default server samples test

default:
	@echo "usage [test|server|samples]"

server:
	./rebar3 shell --apps shortener

test:
	./rebar3 eunit
	./rebar3 ct
