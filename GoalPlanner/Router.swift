//
//  Router.swift
//  GoalPlanner
//
//  Created by Григорий Никитин on 07/05/2020.
//  Copyright © 2020 Григорий Никитин. All rights reserved.
//


import Foundation
import UIKit

// protocol for all routerls
protocol RouterMain {
    var navigationController: UINavigationController? {get set}
    var assemblyBuilder: AssemblyBuilderProtocol? {get set}
}

protocol RouterProtocol: RouterMain {
    func initialViewController()
    func showDetail(goal: Goal?)
    func showAdd()
    func popToRoot()
    func popToRoot(goal: Goal?)
    func transferDataToMain(goal: Goal?) 
}

class Router: RouterProtocol {
    
    var navigationController: UINavigationController?
    var assemblyBuilder: AssemblyBuilderProtocol?
    
    init(navigationController: UINavigationController, assemblyBuilder: AssemblyBuilderProtocol) {
        self.navigationController = navigationController
        self.assemblyBuilder = assemblyBuilder
    }
    
    // Initialize function. Use to define entry point in
    // programm and main view controller.
    
    func initialViewController() {
        if let navigationController = navigationController {
            guard let mainViewController = assemblyBuilder?.createMainModule(router: self) else { return }
            navigationController.viewControllers = [mainViewController]
        }
    }
    // MARK:- Push functions
    func showDetail(goal: Goal?) {
        if let navigationController = navigationController {
            guard let detailViewController = assemblyBuilder?.createDetailModule(goal: goal, router: self) else { return }
            navigationController.pushViewController(detailViewController, animated: true)
        }
        
    }
    
    
    
    // Push to add view contoller.
    // AddView controller represents creating and adding new goals.
    func showAdd() {
        if let _ = navigationController {
            guard let addViewController = assemblyBuilder?.createAddModule(router: self) else { return }
            navigationController?.pushViewController(addViewController, animated: true)
        }
        
    }
    
    // MARK:- Back functions
    // Function returns user to main view controller.
    func popToRoot() {
        if let navigationController = navigationController {
            navigationController.popToRootViewController(animated: true)
        }
    }
    
    // pop to root with adding goal in main presenter array
    func popToRoot(goal: Goal?) {
            
            if let navigationController = navigationController {
                
                guard let mainViewController = navigationController.viewControllers.first as? MainViewController else { return }
                let presenter = mainViewController.presenter
                presenter?.appendGoal(goal: goal)
                presenter?.getGoals()
                navigationController.popToRootViewController(animated: true)
                
            }
            
        
    }
    // transferring goal changes into a main presenter
    func transferDataToMain(goal: Goal?) {
        if let navigationController = navigationController {
        guard let mainViewController = navigationController.viewControllers.first as? MainViewController else { return }
        let presenter = mainViewController.presenter
            if let index = presenter?.goals?.firstIndex(where: { $0.id == goal?.id}) {
                if let goal = goal {
                presenter?.goals?[index] = goal
                }
            }
        }
    }
    
    
}
