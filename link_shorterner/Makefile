.PHONY: default server samples

default:
	@echo "usage [server|samples]"

server:
	./rebar3 shell --apps shortener

# TODO: Common Test
samples:
	@echo "--"
	curl -X POST -i -w "\n"  http://localhost:8080/sample_data
	@echo "--"
	curl -X GET -i -w "\n" http://localhost:8080/XGJ_6
	@echo ""
	curl -X GET -i -w "\n" http://localhost:8080/fail
	@echo ""

