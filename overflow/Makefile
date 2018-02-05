.PHONY: consumer producer

compile:
	./rebar3 compile

consumer: compile
	./rebar3 shell --sname 'consumer@localhost'

producer: compile
	./rebar3 shell --sname 'producer@localhost'
