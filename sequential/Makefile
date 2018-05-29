SUBDIRS = bank_accounts calculate_bmi filter_fibonacci_numbers hello hello_pattern insert_element_at lists maps

.PHONY: test user $(SUBDIRS)

user: TARGET = user
user: $(SUBDIRS)

test: TARGET = test
test: $(SUBDIRS)

$(SUBDIRS):
	$(MAKE) -C $@ $(TARGET)
