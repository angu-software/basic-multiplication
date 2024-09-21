import Testing
import SwiftSpec

enum Spec {

    // #define
    @Suite("NumberGenerator")
    struct NumberGeneratorTests {

        // #context
        @Suite(".generateNumber")
        struct GenerateNumberContext {

            // #when
            @Suite("when called")
            struct WhenCalled {

                // #it
                @Test("it should generate a number between 0 and 10")
                func it_should_generate_a_number_between_0_and_10() async throws {
                    #expect(false == true)
                }

                // #it
                @Test("it should generate a whole number")
                func it_should_generate_a_whole_number_between_0_and_10() async throws {
                    #expect(false == true)
                }
            }
        }
    }
}

//enum Spec {
//
//    #define("NumberGenerator") {
//        #context(".generateNumber") {
//            #when("when called") {
//                #it("it should generate a number between 0 and 10") {
//                    #expect(false == true)
//                }
//
//                #it("it should generate a whole number") {
//                    #expect(false == true)
//                }
//            }
//        }
//    }
//}
