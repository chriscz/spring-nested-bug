## Running it
1. Runing make will:
  - clone spring directory
  - create a `tmp` directory under it
  - create a new rails app `foo` at `spring/tmp/foo`
  - start running bisect in test mode

2. After bisect has complete cd into the spring directory and see the revision.
   If we hit GOOD that means git couldn't find the commit that introduced the failure.
   To make sure of this run `./tmp/test-start-before-enter` and check the exit code (`echo $?`)

3. Edit the makefile and set `TEST_SCRIPT=test-start-before-enter` then run make for the second test.
   Repeat 2 above.

4. Run `make clean` to remove the spring directory

## Test Environment
Ubuntu 20.04
