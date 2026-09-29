fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

## iOS

### ios set_xcode

```sh
[bundle exec] fastlane ios set_xcode
```



### ios build_for_testing

```sh
[bundle exec] fastlane ios build_for_testing
```

Builds the app for testing

### ios test_without_building

```sh
[bundle exec] fastlane ios test_without_building
```

Runs tests without building

### ios clear_artifacts

```sh
[bundle exec] fastlane ios clear_artifacts
```

Clears artifacts

### ios archive_artifacts

```sh
[bundle exec] fastlane ios archive_artifacts
```

Archives produced artifacts

### ios commit_stage

```sh
[bundle exec] fastlane ios commit_stage
```

Commit stage: builds and runs unit tests

### ios acceptance_stage

```sh
[bundle exec] fastlane ios acceptance_stage
```

Acceptance stage: builds and runs acceptance tests

### ios dev_build

```sh
[bundle exec] fastlane ios dev_build
```

Dev build: convenience lane for local development - builds the app for testing

### ios dev_test

```sh
[bundle exec] fastlane ios dev_test
```

Dev test: convenience lane for local development - builds and runs tests without archiving.

By default runs all test plans.

 Use testplans parameter to specify specific test plans.

### ios some_sutom_lane

```sh
[bundle exec] fastlane ios some_sutom_lane
```

Prints the current build environment

----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
