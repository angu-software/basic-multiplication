import SwiftSpec
import Testing

enum Spec {

    #define("Foo") {
        #context("Bar") {
            #when("called") {
                #it("does something") {
                    #expect(false == true)
                }
            }
        }
    }
}
