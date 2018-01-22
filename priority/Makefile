.PHONY: compile, run

default: run

compile:
	erl -compile priority

run: compile
	erl -noshell -s priority send_test -s init stop
