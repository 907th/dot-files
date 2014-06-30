RUN_CMD=docker run -t -i 907th/dot-files:test
BUILD_CMD=docker build -t 907th/dot-files:test $(BUILD_ARGS) .

test:
	$(RUN_CMD) /home/user/test.sh

shell:
	$(RUN_CMD) bash

build:
	$(BUILD_CMD)

.PHONY: *
