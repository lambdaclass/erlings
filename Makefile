DIRS = $(filter-out _build/, $(dir $(wildcard */)))

EXERCISES = $(patsubst %/, %, $(filter-out $(DIRS), $(dir $(wildcard */*/))))
CATEGORIES = $(subst /, , $(DIRS))

PROFILE ?= test

.PHONY: test $(CATEGORIES) $(EXERCISES) check-progress

check-progress:
	./check-progress

test: $(CATEGORIES)

.SECONDEXPANSION:
$(CATEGORIES): $$(filter $$@%, $(EXERCISES))

$(EXERCISES):
	cd $@ && rebar3 as $(PROFILE) ct
