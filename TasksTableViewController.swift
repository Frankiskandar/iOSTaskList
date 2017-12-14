//
//  TasksTableViewController.swift
//  Fnu_Frangky_Lab06
//
//  Created by Fnu Frangky on 12/12/17.
//  Copyright © 2017 Fnu Frangky. All rights reserved.
//

import UIKit

class TasksTableViewController: UITableViewController {
    
    var taskList = TaskList()
    
    
    func loadTasks() {
        
        var t1 = Task(text: "task1", dueDate: Date(), priority: .medium, completed: true)
        var t2 = Task(text: "task2", dueDate: Date(), priority: .medium, completed: true)
        taskList.add(t1)
        taskList.add(t2)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadTasks()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return taskList.Count()
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "TaskTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TaskTableViewCell else {
            fatalError("The dequeued cell is not an instance of TaskTableViewCell")
        }
        
        //fetches the appropriate task for data source layout
        
        let task = taskList.tasks[indexPath.row]
        // Configure the cell...
        cell.taskNameLabel.text = task.text as String
        if let date = task.dueDate {
            let dateFormatter = DateFormatter()
            
            dateFormatter.dateStyle = DateFormatter.Style.medium
            
            dateFormatter.timeStyle = DateFormatter.Style.none
            
            
            //DueDateButton.setTitle(dateFormatter.string(from: sender.date), for: .normal)
            
            cell.dueDateLabel.text = "Due: " + dateFormatter.string(from: date)

        }
        

        return cell
    }
    
    // MARK - actionas
    
    @IBAction func unwindToTaskList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? TaskViewController, let task = sourceViewController.task {
            
            // add 
            let newIndexPath = IndexPath(row: taskList.Count(), section: 0)
            taskList.add(task)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
