//
//  AddViewController.swift
//  GoalPlanner
//
//  Created by Григорий Никитин on 08/05/2020.
//  Copyright © 2020 Григорий Никитин. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextView: UITextView!
    // presenter instance
    var presenter: AddPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }


    @IBAction func doneButtonAction(_ sender: Any) {
        presenter.createGoal(name: nameTextField.text!, description: descriptionTextView.text!)
        presenter.done()
    }
    
}

extension AddViewController: AddViewProtocol {
    
}
