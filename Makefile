BAD_REVISION=master
GOOD_REVISION=v2.0.0

# TEST_SCRIPT=test-start-before-enter
TEST_SCRIPT=test-start-after-enter

LOGFILE=$(shell readlink -f ./run.log)

APP_NAME=myapp
APP_PATH=$(shell readlink -f $(APP_NAME))
APP_DIRNAME=$(shell dirname $(APP_PATH))

SPRING_REPO_PATH=$(shell readlink -f ./spring)

export SPRING_REPO_PATH
export BAD_REVISION
export GOOD_REVISION
export TEST_SCRIPT
export LOGFILE

export APP_NAME
export APP_PATH
export APP_DIRNAME

bisect: prepare spring
	script/bisect

prepare:
	bundle install

spring:
	git clone git@github.com:rails/spring.git

clean:
	rm -rf spring/
	rm -f run.log
	rm -rf $(APP_PATH)

.PHONY: clean prepare bisect
