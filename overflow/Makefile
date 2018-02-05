.PHONY: consumer producer

compile:
	./rebar3 compile
	docker build . -t 'erlang-overflow:latest'

create-network:
	-docker network create --driver bridge erlang-overflow-network

consumer: compile create-network
	docker run --rm --network erlang-overflow-network \
		--memory 512m --memory-swap 0m \
		--name consumer \
		-it erlang-overflow  \
		rebar3 shell --sname 'consumer@consumer'

producer: compile create-network
	docker run --rm --network erlang-overflow-network \
		--name producer \
		-it erlang-overflow \
		rebar3 shell --sname 'producer@producer'
