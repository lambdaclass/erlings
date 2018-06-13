DIRS = $(filter-out _build/, $(dir $(wildcard */)))

EXERCISES = $(patsubst %/, %, $(filter-out $(DIRS), $(dir $(wildcard */*/))))
CATEGORIES = $(subst /, , $(DIRS))

PROFILE ?= test $(EXERCISES) $(CATEGORIES)

.PHONY: test $(CATEGORIES) $(EXERCISES)

test: $(CATEGORIES)

.SECONDEXPANSION:
$(CATEGORIES): $$(filter $$@%, $(EXERCISES))

$(EXERCISES):
	cd $@ && ../../rebar3 as $(PROFILE) ct
