.PHONY: default server samples test

default:
	@echo "usage [test|server|samples]"

server:
	./rebar3 shell --apps shortener

test:
	./rebar3 eunit
	./rebar3 ct

# TODO: Common Test
samples:
	@echo "--"
	curl -X POST -i -w "\n"  http://localhost:8080/sample_data
	@echo "--"
	curl -X GET -i -w "\n" http://localhost:8080/GJ_6g
	@echo ""
	curl -X GET -i -w "\n" http://localhost:8080/fail
	@echo ""
