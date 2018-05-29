SUBDIRS = sequential

.PHONY: test user $(SUBDIRS)

user: TARGET = user
user: $(SUBDIRS)

test: TARGET = test
test: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@ $(TARGET)
