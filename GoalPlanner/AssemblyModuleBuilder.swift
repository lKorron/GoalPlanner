//
//  AssemblyModuleBuilder.swift
//  GoalPlanner
//
//  Created by Григорий Никитин on 07/05/2020.
//  Copyright © 2020 Григорий Никитин. All rights reserved.
//

import Foundation
import UIKit

protocol AssemblyBuilderProtocol {
    func createMainModule(router: RouterProtocol) -> UIViewController
    func createDetailModule(goal: Goal?, router: RouterProtocol) -> UIViewController
    func createAddModule(router: RouterProtocol) -> UIViewController
}


class AssemblyModuleBuilder: AssemblyBuilderProtocol {
    
    // main page
    func createMainModule(router: RouterProtocol) -> UIViewController {
        let view = MainViewController()
        let presenter = MainPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    // goal's detail page
    func createDetailModule(goal: Goal?, router: RouterProtocol) -> UIViewController {
        let view = DetailViewController()
        let presenter = DetailPresenter(view: view, router: router, goal: goal!)
        view.presenter = presenter
        return view
    }
    
    func createAddModule(router: RouterProtocol) -> UIViewController {
        let view = AddViewController()
        let presenter = AddPresenter(view: view, router: router)
        view.presenter = presenter
        return view
    }
    
    
}
