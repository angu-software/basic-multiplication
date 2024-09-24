# SwiftSpec

I ideation for a `SwiftSpec` testing framework based on `SwiftTesting` and custom `swift macros`

```swift
 #define("NumberGenerator") {
     #context("When it generates a number") {
        #it("should be between 0 and 10") {
            #expect(...)
        }
     }
 }
```

* Blog

"How I failed to create a SwiftSpec (with Swift macros)"
"And what I 'found' instead"

* Swift evolution discussion
https://forums.swift.org/t/a-new-approach-to-testing-in-swift/67425/62?page=5
- Suggest to support RSpec like structure/definitions of tests
