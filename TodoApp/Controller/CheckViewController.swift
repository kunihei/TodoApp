//
//  CheckViewController.swift
//  TodoApp
//
//  Created by 祥平 on 2021/04/09.
//

import UIKit

class CheckViewController: UIViewController {
    
    var todoString = String()
    var dateString = String()
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var todoTextField: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        todoTextField.isEditable = false
        
        dateLabel.text = dateString
        todoTextField.text = todoString
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
