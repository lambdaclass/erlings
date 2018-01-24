.PHONY: compile run

default: run

compile:
	erl -compile remote_fun_server
	erl -compile remote_fun_client

run: compile
	erl -noshell -s remote_fun_server function_server -s init stop \
        -sname 'function_server@localhost' -setcookie 'remote_fun_cookie' &
	erl -noshell -s remote_fun_client function_client -s init stop \
        -sname 'function_client@localhost' -setcookie 'remote_fun_cookie'	
