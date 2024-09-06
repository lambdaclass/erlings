.PHONY: default server samples test

default:
	@echo "usage [test|server]"

server:
	rebar3 shell --apps shortly

node_1:
	rebar3 shell --apps shortly --config src/config/node_1.config --sname node_1

node_2:
	rebar3 shell --apps shortly --config src/config/node_2.config --sname node_2
