//
//  A11yIDTests.swift
//  A11y
//
//  Created by Andreas Guenther on 14.11.24.
//

import Testing

@testable import A11y

enum A11yIDTests {

    @Suite("When creating an instance")
    struct WhenCreatingIdentifier {
        @Test("it creates an identifier string containing all specified segments")
        func it_creates_an_identifier_containing_all_specified_segments() {
            let a11yId = A11yID(screenName: "MainScreen",
                                componentType: .button,
                                actionOrState: "Next",
                                optionalDetails: "Enabled")

            #expect(a11yId.value == "MainScreen_Button_Next_Enabled")
        }

        @Suite("and no details are specified")
        struct NoDetailsSpecified {

            @Test("it creates an identifier without the details segment")
            func it_creates_an_identifier_without_the_details_segment() {
                let a11yId = A11yID(screenName: "MainScreen",
                                    componentType: .button,
                                    actionOrState: "Next")

                #expect(a11yId.value == "MainScreen_Button_Next")
            }
        }
    }
}
