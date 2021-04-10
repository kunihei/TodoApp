//
//  ViewController.swift
//  TodoApp
//
//  Created by 祥平 on 2021/04/08.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var date: UIDatePicker!
    @IBOutlet weak var textField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touroku(_ sender: Any) {
        if textField.text.isEmpty != true{
            
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy年MM月dd日"
            
            UserDefaults.standard.setValue(textField.text, forKey: "comment")
            UserDefaults.standard.setValue(formatter.string(from: date.date), forKey: "date")
            navigationController?.popViewController(animated: true)
        }
    }
}

