#!Makefile

all: build

build:
	source .env; \
	docker build . -t $${TARGET_IMAGE}

test/dgoss:
	source .env; \
	dgoss run $${TARGET_IMAGE}; \
	GOSS_OPTS="--format junit" dgoss run $${TARGET_IMAGE}
	 > /tmp/goss.junit.xml