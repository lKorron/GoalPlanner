//
//  DetailViewController.swift
//  GoalPlanner
//
//  Created by Григорий Никитин on 12/05/2020.
//  Copyright © 2020 Григорий Никитин. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    //MARK: - IBOutlets
    
    @IBOutlet weak var goalNameLabel: UILabel!
    @IBOutlet weak var goalEditNameTextView: UITextView!
    @IBOutlet weak var descriptionTextField: UITextView!
    @IBOutlet weak var isDoneSwitch: UISwitch!
    
    var presenter: DetailPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionTextField.delegate = self
        goalEditNameTextView.delegate = self
        goalEditNameTextView.textContainer.maximumNumberOfLines = 1
    }
    
    override func viewWillAppear(_ animated: Bool) {
         presenter.setGoal()
    }
    
    @IBAction func switchAction(_ sender: Any) {
        presenter.goal?.isDone = isDoneSwitch.isOn
        presenter.dataTransferToMain()
        
    }
    @IBAction func editNameAction(_ sender: Any) {
        goalNameLabel.text = goalEditNameTextView.text
        goalEditNameTextView.text = goalNameLabel.text
        goalNameLabel.isHidden = !goalNameLabel.isHidden
        goalEditNameTextView.isHidden = !goalEditNameTextView.isHidden
        
    }
    
}

extension DetailViewController: UITextViewDelegate {
    func textViewDidEndEditing(_ textView: UITextView) {
        if let goalName = goalNameLabel.text {
            presenter.goal?.name = goalName
        }
        
        presenter.goal?.description = descriptionTextField.text
        presenter.dataTransferToMain()
    }
}

extension DetailViewController: DetailViewProtocol {
    
    func setGoalName(goal: Goal?) {
        if let goalNameLabel = goalNameLabel {
            goalNameLabel.text = goal?.name
        }
    }
    
    func setGoalDescription(goal: Goal?) {
        if let descriptionTextField = descriptionTextField {
        descriptionTextField.text = goal?.description
        }
    }
    
    func setGoalIsActiveFlag(goal: Goal?) {
        if let isDoneSwitch = isDoneSwitch {
        isDoneSwitch.setOn(goal?.isDone ?? false, animated: true)
        }
    }
    
    
   
    
    
}
