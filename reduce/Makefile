.PHONY: compile test

default: test

compile:
	erl -compile reduce

test: compile
	erl -noshell -s reduce test -s init stop
