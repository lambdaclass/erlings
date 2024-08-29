# Installing

## Reading Material

- [Learn You Some Erlang: Introduction](http://learnyousomeerlang.com/introduction)

## Requirements

In this exercise we will setup our environment before we start our
real coding. We will need some software:

- Erlang 27.
- Make (probably already installed on your system).
- Rebar.

We suggest 2 ways to install Erlang + Rebar: asdf or nix.

### ASDF

First, we need to install ASDF:
```sh
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.14.1
```
Then we'll have to add this to your bash or zsh config file:
```sh
. "$HOME/.asdf/asdf.sh"
```
Or, if you're using fish:
```fish
source ~/.asdf/asdf.fish
```

Be sure to check asdf's website, since there are some extra goodies to config
like shell completions.

```sh
asdf plugin add erlang https://github.com/asdf-vm/asdf-erlang.git
```

And finally, install erlang 27.0.1:
```sh
asdf install erlang 27.0.1 && asdf global erlang 27.0.1
```

The global command is just to tell your environment to always use erlang 27, you
can use `asdf local` instead to have distinct versions base on which folder you're currently in.

### Nix

Clone the repo: 
```sh
git clone https://github.com/lambdaclass/erlings.git
```
cd into this folder and eval the nix shell:
```sh
cd erlings/sequential/install && nix-shell
```
This will drop you into a bare-bones bash shell with erlang and rebar installed,
which you can use for the exercises.

## Checking environment

To check your environment do the following:

~~~
$> git clone https://github.com/lambdaclass/erlings.git
$> cd ~/erlings/sequential/installing
$> make
~~~

You should get the following output:

~~~
rebar3 ct
===> Verifying dependencies...
===> Analyzing applications...
===> Compiling installing
===> Running Common Test suites...
%%% installing_SUITE: .
All 1 tests passed.
~~~
