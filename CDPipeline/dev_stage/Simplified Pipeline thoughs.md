# Simplified pipeline

No artifact store
Steps should be able to execute locally

1. Development state
   1. Build for testing
   2. Test fast tests
2. Acceptance stage
   1. UI tests
3. Deployment Stage
   1. Build archive
   2. Mark as RC

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

## Notes

* cancel running ACC tests if a new dev test is started