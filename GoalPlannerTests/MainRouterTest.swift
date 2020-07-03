//
//  MainRouterTest.swift
//  GoalPlannerUITests
//
//  Created by Григорий Никитин on 08/05/2020.
//  Copyright © 2020 Григорий Никитин. All rights reserved.
//

import XCTest
@testable import GoalPlanner

class MockNavigationController: UINavigationController {
    var presentedVC: UIViewController?
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        self.presentedVC = viewController
        super.pushViewController(viewController, animated: animated)
    }
}


class MainRouterTest: XCTestCase {

    var router: RouterProtocol?
    var navigationController = MockNavigationController()
    var assemblyBuilder = AssemblyModuleBuilder()
    
    override func setUp() {
        router = Router(navigationController: navigationController, assemblyBuilder: assemblyBuilder)
    }

    override func tearDown() {
        router = nil
    }

    func testAddRouter() {
        router?.showAdd()
        let nextViewController = navigationController.presentedVC
        XCTAssertTrue(nextViewController is AddViewController)
    }
}
