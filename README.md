## Running the test

1. Clone Repository
2. Run `make`, this will:
  - clone spring directory
  - create a new `myapp` rails application
  - cd into spring
  - start running git bisect via `script/bisect`

3. After bisect has completed, run `cd spring` and see the revision.
   If we hit GOOD Revision that means git couldn't find the commit that introduced the failure.
   To make sure of this run `../script/test-start-before-enter` from within `spring` and check the exit code (`echo $?`) and the `run.log` file

4. Edit the makefile and set `TEST_SCRIPT=test-start-before-enter` then run make for the second test.
   Repeat 3 above.

5. Run `make clean` to remove the spring directory

## Test Environment
Ubuntu 20.04
