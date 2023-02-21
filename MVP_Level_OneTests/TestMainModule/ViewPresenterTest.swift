//
//  ViewPresenterTest.swift
//  MVP - Level OneTests
//
//  Created by Александр on 21.02.2023.
//

import XCTest
@testable import MVP_Level_One
class MockView: MainViewProtocol {
    var titleTest: String?
    func setGreeting(greeting: String) {
        self.titleTest = greeting
    }
    
    
}
final class ViewPresenterTest: XCTestCase {

    var view: MockView!
    var person: Person!
    var presenter: MainPresenter!
    
    override func setUp() {
        view = MockView()
        person = Person(firstName: "Baz", lastName: "Bar")
        presenter = MainPresenter(view: view, person: person)
    }
    override func tearDown() {
        view = nil
        person = nil
        presenter = nil
    }
    func testModuleIsNotNil() {
        XCTAssertNotNil(view, "view is not nil")
        XCTAssertNotNil(presenter, "view is not presenter")
        XCTAssertNotNil(person, "view is not person")
    }
    func testView() {
        presenter.showGreeting()
        XCTAssertEqual(view.titleTest, "Baz Bar")
    }
    func testPerson() {
        XCTAssertEqual(person.firstName, "Baz")
        XCTAssertEqual(person.lastName, "Bar")
    }
}
