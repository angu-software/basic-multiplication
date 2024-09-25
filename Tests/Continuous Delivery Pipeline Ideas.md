# Continuous Delivery Pipeline Ideas

* [ ] Define constants in config file

## DevelopmentTests

* [ ] Run test targets in parallel for development OS version
* [ ] Lint the code (static analysis)
* [ ] Store test results in artifacts
* [ ] Build once for a platform and put into artifacts

## Acceptance tests

* [ ] UITests
* [ ] Flakiness detection (execute tests multiple times)
* [ ] Run (development) tests for min deployment target
* [ ] Performance tests (launch performance)

## Other considerations
* [ ] Check for warnings
* [ ] Check for warning threshold (should not introduce more, should reduce warnings)
