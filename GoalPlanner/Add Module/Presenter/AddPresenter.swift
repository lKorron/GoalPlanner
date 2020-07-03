//
//  AddPresenter.swift
//  GoalPlanner
//
//  Created by Григорий Никитин on 08/05/2020.
//  Copyright © 2020 Григорий Никитин. All rights reserved.
//

import Foundation

//Output protocol
protocol AddViewProtocol: class {
    
}

//Input protocol
protocol AddPresenterProtocol: class {
    init(view: AddViewProtocol, router: RouterProtocol)
    func createGoal(name: String, description: String)
    func done()
}


class AddPresenter: AddPresenterProtocol {
    
    weak var view: AddViewProtocol?
    var router: RouterProtocol?
    var goal: Goal?
    
    required init(view: AddViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
    }
    
    func createGoal(name: String, description: String) {
        let id = UUID.init()
        let goal = Goal(name: name, description: description, isDone: false, id: id)
        self.goal = goal
    }
    
    func done() {
        if let goal = goal {
            router?.popToRoot(goal: goal)
        }
    }
    
    
}
