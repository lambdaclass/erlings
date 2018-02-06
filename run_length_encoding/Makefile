.PHONY: compile test

default: test

compile:
	erl -compile run_length

test: compile
	erl -noshell -s run_length test -s init stop
