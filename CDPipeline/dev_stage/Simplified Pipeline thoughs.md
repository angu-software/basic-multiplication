# Simplified pipeline

No artifact store
Steps should be able to execute locally

1. Development state
  1. Build for testing
  2. Test fast tests
2. Acceptance stage
  1. UI tests
3. RC Stage
  1. Set version and build
  1. Build archive
  2. Mark as RC
   
4. Deployment Stage (merge with RC Stage)
  1. Collect metadata artifacts
  2. Upload metadata
  3. Upload archive

5. Release Stage (manual)
  1. Verify app meta data with version in repo
  2. Tell App store connect to release the chosen build
  3. Release automatically (staged)
  4. Tag version
    - Find RC tag and rename
    - Find all RC tags after and rename them with the new version

## Tag format

Tag format
- Release: `major.minor.patch.build`
- RC: `major.minor.patch.build`
- `build` auto increments

## Execution artifacts folder structure

* Share build artifacts for testing

.xcpipeline
  |- derived_data
  |- artifacts
    |- development
        |- build
        |- tests
    |- acceptance
        |- build
        |- tests
    |- deploy
        |- build

## Features

* swiftlint in dev stage separate from test run
* swiftlint analyse in Acc state again build product

## Notes

* Cancel running ACC tests if a new dev test is started
