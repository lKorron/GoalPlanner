//
//  MainPresenter.swift
//  GoalPlanner
//
//  Created by Григорий Никитин on 28/04/2020.
//  Copyright © 2020 Григорий Никитин. All rights reserved.
//

import Foundation

//Output protocol
protocol MainViewProtocol: class {
    func success()
    func failure()

}

//Input protocol
protocol MainPresenterProtocol: class {
    init(view: MainViewProtocol, router: RouterProtocol)
    var goals: [Goal]? { get set }
    func getGoals()
    func showAddGoal()
    func tapOnTheGoal(goal: Goal?)
    func appendGoal(goal: Goal?)
    
}

class MainPresenter: MainPresenterProtocol {
    
    weak var view: MainViewProtocol?
    var router: RouterProtocol?
    var goals: [Goal]? = []
    
    required init(view: MainViewProtocol, router: RouterProtocol) {
        self.view = view
        self.router = router
        // getting goals in future
        // getGoals()
        
    }
    
    func getGoals() {
        if goals?.count == 0{
            view?.failure()
        }
        else {
            view?.success()
        }
    }
    
    func tapOnTheGoal(goal: Goal?) {
        if let router = router {
            router.showDetail(goal: goal)
        }
    }
    
    func showAddGoal() {
        router?.showAdd()
    }
    
    func appendGoal(goal: Goal?) {
        if let goal = goal {
            self.goals?.append(goal)
        }
    }
    
    
    
    
    
}


