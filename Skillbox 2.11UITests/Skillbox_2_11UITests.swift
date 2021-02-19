//
//  Skillbox_2_11UITests.swift
//  Skillbox 2.11UITests
//
//  Created by Артём on 2/17/21.
//

import XCTest

class Skillbox_2_11UITests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
//        Тест на обработку неправильных данных :
        
// 1 тест (Были проблемы с написанием текста в строку пароль - не открывалась клавиатура, а потом если открывалась то не закрывалась, решено вставкой текста)
        app.textFields["login"].tap()
        app.textFields["login"].typeText("AФФФtem6@dn.ru")
//        app.textFields["password"].tap()
//        app.textFields["password"].typeText("Artebf4")
        let pasteboard = UIPasteboard.general
        pasteboard.string = "HArtebf4"
        app.textFields["password"].press(forDuration: 1.1)
        app.menuItems.element(boundBy: 0).tap()
        app.buttons["Войти"].tap()
      
        
        //   2 ТЕСТ
        
//        app.textFields["login"].tap()
//        app.textFields["login"].typeText("Artem6dn.ru")
//        let ppasteboard = UIPasteboard.general
//        ppasteboard.string = "HArtebf4"
//        app.textFields["password"].press(forDuration: 1.1)
//        app.menuItems.element(boundBy: 0).tap()
//        app.buttons["Войти"].tap()
   
        //   3 ТЕСТ
        
//        app.textFields["login"].tap()
//        app.textFields["login"].typeText("Artem@dn.ru")
//        let ppasteboard = UIPasteboard.general
//        ppasteboard.string = "H4"
//        app.textFields["password"].press(forDuration: 1.1)
//        app.menuItems.element(boundBy: 0).tap()
//        app.buttons["Войти"].tap()

        
        //        Тесты на обработку неправильных данных :
        
//        app.textFields["login"].tap()
//        app.textFields["login"].typeText("Artem6@dn.ru")
//        let pasteboard = UIPasteboard.general
//        pasteboard.string = "HArtebf4"
//        app.textFields["password"].press(forDuration: 1.1)
//        app.menuItems.element(boundBy: 0).tap()
//        app.buttons["Войти"].tap()
        
//                app.textFields["login"].tap()
//                app.textFields["login"].typeText("ArEMm6@dn.ru")
//                let pasteboard = UIPasteboard.general
//                pasteboard.string = "j655yYYYrtebf4"
//                app.textFields["password"].press(forDuration: 1.1)
//                app.menuItems.element(boundBy: 0).tap()
//                app.buttons["Войти"].tap()
        
            //        app.navigationBars.buttons.element(boundBy: 0).tap()
            //        app.buttons["Back"].tap()
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
