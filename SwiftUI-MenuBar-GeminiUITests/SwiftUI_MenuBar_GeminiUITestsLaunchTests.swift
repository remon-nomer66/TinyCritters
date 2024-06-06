//
//  SwiftUI_MenuBar_GeminiUITestsLaunchTests.swift
//  SwiftUI-MenuBar-GeminiUITests
//
//  Created by Remon Nakashima on R 6/06/06.
//

import XCTest

final class SwiftUI_MenuBar_GeminiUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
