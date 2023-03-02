//
//  RouterTest.swift
//  MVP_Level_OneTests
//
//  Created by Александр on 02.03.2023.
//

import XCTest
@testable import MVP_Level_One

class MockNavigationController: UINavigationController {
    var presentedVC: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.presentedVC = viewController
        super.pushViewController(viewController, animated: true)
    }
}


final class RouterTest: XCTestCase {

    let assembly = AssemblyModuleBuilder()
    var router: RouterProtocol!
    var navigationController = MockNavigationController()
    
    override func setUp() {
        router = Router(navigationController: navigationController, assemblyBuilder: assembly)
    }

    override func tearDown() {
        router = nil
    }
    
    func testRouter() {
        router.showDetail(comment: nil)
        let detailVC = navigationController.presentedVC
        
        XCTAssertTrue(detailVC is DetailViewController)
    }
}
