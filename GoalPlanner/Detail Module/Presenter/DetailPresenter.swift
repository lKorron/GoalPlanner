//
//  DetailPresenter.swift
//  GoalPlanner
//
//  Created by Григорий Никитин on 12/05/2020.
//  Copyright © 2020 Григорий Никитин. All rights reserved.
//

import Foundation

// output protocol
protocol DetailViewProtocol: class {
    func setGoalName(goal: Goal?)
    func setGoalDescription(goal: Goal?)
    func setGoalIsActiveFlag(goal: Goal?)
}

// input protocol
protocol DetailPresenterProtocol: class {
    init(view: DetailViewProtocol, router: RouterProtocol, goal: Goal)
    func setGoal()
    func setGoalFlag()
    func dataTransferToMain()
    var goal: Goal? { get set }
}

class DetailPresenter: DetailPresenterProtocol {
    
    
    weak var view: DetailViewProtocol?
    var router: RouterProtocol?
    var goal: Goal?
    
    required init(view: DetailViewProtocol, router: RouterProtocol, goal: Goal) {
        self.view = view
        self.router = router
        self.goal = goal
        
    }
    
    func setGoal() {
        self.view?.setGoalName(goal: self.goal)
        self.view?.setGoalDescription(goal: self.goal)
        self.view?.setGoalIsActiveFlag(goal: self.goal)
    }
    
    func setGoalFlag() {
        self.view?.setGoalIsActiveFlag(goal: self.goal)
    }
    
    func dataTransferToMain() {
        router?.transferDataToMain(goal: self.goal)
    }
    
    
}
