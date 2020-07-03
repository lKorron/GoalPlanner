//
//  MainViewController.swift
//  GoalPlanner
//
//  Created by Григорий Никитин on 07/05/2020.
//  Copyright © 2020 Григорий Никитин. All rights reserved.
//

import UIKit



class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var presenter: MainPresenter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Goal")
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        presenter.getGoals()
    }
    
    @IBAction func addButtonAction(_ sender: Any) {
        presenter.showAddGoal()
    }
    
}

// MARK: - Data source
extension MainViewController: UITableViewDataSource {
    // Number of goals
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.goals?.count ?? 0
    }
    
    // Cell setting
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Goal", for: indexPath)
        let goals = presenter.goals
        if let goals = goals{
        let goal = goals[indexPath.row]
            if goal.isDone {
                cell.imageView?.image = UIImage(systemName: "circle.fill")
                
            }
            else {
                cell.imageView?.image = UIImage(systemName: "circle")
            }
            cell.textLabel?.text = goals[indexPath.row].name
        }
        
        return cell
    }
    
    
    
    
    
}
// MARK: - Delegate
extension MainViewController: UITableViewDelegate {
    // Routing
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let goal = presenter.goals?[indexPath.row]
        presenter.tapOnTheGoal(goal: goal)
    }
}

extension MainViewController: MainViewProtocol {
    
    func success() {
        if let tableView = tableView {
        tableView.reloadData()
        }
    }
    
    func failure() {
        print("load data to main view error")
    }
    
    
}

  
    
