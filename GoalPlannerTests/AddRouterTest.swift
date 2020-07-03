//
//  AddRouterTest.swift
//  GoalPlannerTests
//
//  Created by Григорий Никитин on 10/05/2020.
//  Copyright © 2020 Григорий Никитин. All rights reserved.
//

import XCTest
@testable import GoalPlanner

class MockViewController: UIViewController {

    var presenter: MainPresenterProtocol!
    
    
}

extension MockViewController: MainViewProtocol {
    func success() {
        print("succes")
    }
    
    func failure() {
        print("failure")
    }
    
    
}


class AddRouterTest: XCTestCase {

    var router: RouterProtocol?
    var navigationController = UINavigationController()
    var assemlyBuilder = AssemblyModuleBuilder()
    var firstViewContoller: UIViewController!
    var secondViewController: UIViewController!
    
    override func setUp() {
        // for testPopToRoot()
        router = Router(navigationController: navigationController, assemblyBuilder: assemlyBuilder)
        firstViewContoller = assemlyBuilder.createMainModule(router: router!)
        secondViewController = assemlyBuilder.createAddModule(router: router!)
        navigationController.viewControllers = [firstViewContoller, secondViewController]
        
        // for testPopToRootWithGoal
        
    }

    override func tearDown() {
        router = nil
        firstViewContoller = nil
        secondViewController = nil
        navigationController.viewControllers = []
    }

    func testPopToRoot(){
        router?.popToRoot()
        let viewController = navigationController.viewControllers.last
        XCTAssert(viewController is MainViewController)
    }
    
    func testPopToRootWithGoal() {
        let goal = Goal(name: "bar", description: "baz", isDone: false)
        router?.popToRoot(goal: goal)
        guard let viewController = self.navigationController.viewControllers.last as? MainViewController else { return }
        let name = viewController.presenter.goals?.last?.name
        XCTAssertEqual(name, "bar")
        
    }
    
    

}
