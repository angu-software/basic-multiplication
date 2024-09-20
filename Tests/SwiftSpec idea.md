# SwiftSpec

I ideation for a `SwiftSpec` testing framework based on `SwiftTesting` and custom `swift macros`

```swift
 #define("NumberGenerator") { // overloads with concrete type
     #context("getRandomNumber") { // method to test, override with KeyPath
         #when("generating number") {
             #it("should be in range") {
               #expect(...)
             }
         }
     }
 }
```
