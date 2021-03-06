/* This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at http://mozilla.org/MPL/2.0/. */

import XCTest

class MailAppSettingsTests: BaseTestCase {
    func testOpenMailAppSettings() {
        navigator.goto(OpenWithSettings)

        // Check that the list is shown
        waitforExistence(app.tables["OpenWithPage.Setting.Options"])
        XCTAssertTrue(app.tables["OpenWithPage.Setting.Options"].exists)
        XCTAssertTrue(app.tables.staticTexts["OPEN MAIL LINKS WITH"].exists)

        // Check that user can go back from that setting
        navigator.goto(HomePanelsScreen)
    }

    func testDefaultOptionsDisabled() {
        navigator.goto(OpenWithSettings)

        // Check that the list is shown with all elements disabled
        waitforExistence(app.tables["OpenWithPage.Setting.Options"])
        XCTAssertFalse(app.tables.cells.staticTexts["Mail"].isSelected)
        XCTAssertFalse(app.tables.cells.staticTexts["Outlook"].isSelected)
        XCTAssertFalse(app.tables.cells.staticTexts["Airmail"].isSelected)
        XCTAssertFalse(app.tables.cells.staticTexts["Mail.Ru"].isSelected)
        XCTAssertFalse(app.tables.cells.staticTexts["myMail"].isSelected)
        XCTAssertFalse(app.tables.cells.staticTexts["Spark"].isSelected)
        XCTAssertFalse(app.tables.cells.staticTexts["YMail!"].isSelected)
        XCTAssertFalse(app.tables.cells.staticTexts["Gmail"].isSelected)
        XCTAssertFalse(app.tables.cells.staticTexts["Inbox by Gmail"].isSelected)
    }

    func testTapOnDisabledOptionDoesNothing() {
        navigator.goto(OpenWithSettings)

        // Check that tapping on an element does nothing
        waitforExistence(app.tables["OpenWithPage.Setting.Options"])
        app.tables.cells.staticTexts["Airmail"].tap()
        XCTAssertFalse(app.tables.cells.staticTexts["Airmail"].isSelected)
    }
}
