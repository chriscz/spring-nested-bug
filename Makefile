BAD_REVISION=master
GOOD_REVISION=v2.0.0

# TEST_SCRIPT=test-start-before-enter
TEST_SCRIPT=test-start-after-enter

LOGFILE=$(shell readlink -f ./run.log)

export GOOD_REVISION
export BAD_REVISION
export TEST_SCRIPT
export LOGFILE


bisect: prepare
	echo
	(cd spring && ./tmp/bisect)

prepare: spring
	mkdir -p spring/tmp
	cp script/* spring/tmp
	cp Gemfile spring/tmp

spring:
	git clone git@github.com:rails/spring.git

clean:
	rm -rf spring/
	rm -f run.log

.PHONY: clean prepare bisect
