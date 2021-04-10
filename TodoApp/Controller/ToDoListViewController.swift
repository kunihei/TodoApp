//
//  ToDoListViewController.swift
//  TodoApp
//
//  Created by 祥平 on 2021/04/09.
//

import UIKit

class ToDoListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var addButton: UIButton!
    
    var commentList:[String] = []
    var dateList:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addButton.layer.cornerRadius = 50
        
        tableView.delegate = self
        tableView.dataSource = self
        UserDefaults.standard.removeObject(forKey: "comment")
        UserDefaults.standard.removeObject(forKey: "date")
        if let defaultComment:[String] = UserDefaults.standard.object(forKey: "commentList") as? [String], let defaultDate:[String] = UserDefaults.standard.object(forKey: "dateList") as? [String] {
            for i in 0..<defaultComment.count{
                commentList.append(defaultComment[i])
                dateList.append(defaultDate[i])
            }
            
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let comment = UserDefaults.standard.object(forKey: "comment"), let date = UserDefaults.standard.object(forKey: "date"){
            commentList.append(comment as! String)
            dateList.append(date as! String)
            UserDefaults.standard.setValue(commentList, forKey: "commentList")
            UserDefaults.standard.setValue(dateList, forKey: "dateList")
        }
        
        tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let editAction = UIContextualAction(style: .normal, title: "編集") { (action, view, completionHandler) in
            
            
            
            completionHandler(true)
        }
        
        let deleteAction = UIContextualAction(style: .normal, title: "削除") { (action, view, completionHandler) in
            self.commentList.remove(at: indexPath.row)
            self.dateList.remove(at: indexPath.row)
            UserDefaults.standard.setValue(self.commentList, forKey: "commentList")
            UserDefaults.standard.setValue(self.dateList, forKey: "dateList")
            tableView.reloadData()
            
            completionHandler(true)
        }
        editAction.backgroundColor = .blue
        deleteAction.backgroundColor = .red
        return UISwipeActionsConfiguration(actions: [deleteAction, editAction])
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return commentList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let commentLabel = cell.contentView.viewWithTag(1) as! UILabel
        let dateLabel = cell.contentView.viewWithTag(2) as! UILabel
        
        commentLabel.text = commentList[indexPath.row]
        dateLabel.text = dateList[indexPath.row]
        cell.selectionStyle = .none
        
        return cell
    }
    
    @IBAction func add(_ sender: Any) {
        
        let registVC = self.storyboard?.instantiateViewController(withIdentifier: "registVC") as! ViewController
        self.navigationController?.pushViewController(registVC, animated: true)
        
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
