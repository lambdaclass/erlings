.PHONY: compile test

default: test

compile:
	erl -compile even_fib_numbers

test: compile
	erl -noshell -s even_fib_numbers test -s init stop


