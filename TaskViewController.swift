//
//  TaskViewController.swift
//  Fnu_Frangky_Lab06
//
//  Created by Fnu Frangky on 12/12/17.
//  Copyright © 2017 Fnu Frangky. All rights reserved.
//

import UIKit
import os.log

class TaskViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return arr.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerSelector = arr[row]
        PriorityButton.setTitle(pickerSelector, for: .normal)
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arr[row]
    }
    
    
    var arr: [String] = ["Low", "Medium", "High"]
    var pickerSelector = ""
    
    // Task Name
    @IBOutlet weak var TaskName: UITextField!
    
    // CompletedStatus
    @IBOutlet weak var CompletedStatus: UISegmentedControl!
    
    // Priority
    @IBOutlet weak var PriorityButton: UIButton!
    @IBOutlet weak var PriorityPicker: UIPickerView!
    
    
    
    
    // DueDate
    @IBOutlet weak var DueDateButton: UIButton!
    @IBOutlet weak var DueDatePicker: UIDatePicker!
    
    
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var saveTask: UINavigationItem!
    

    
    var task: Task?
    var dueDate: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PriorityPicker.isHidden = true
        DueDatePicker.isHidden = true
        DueDatePicker.datePickerMode = UIDatePickerMode.date
        //DueDateButton.text = DueDatePicker
        DueDatePicker.addTarget(self, action: #selector(datePickerValueChanged), for: UIControlEvents.valueChanged)

        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Action
    // Make a dateFormatter in which format you would like to display the selected date in the textfield.
    @objc func datePickerValueChanged(sender:UIDatePicker) {
        
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.medium
        
        dateFormatter.timeStyle = DateFormatter.Style.none
        
        DueDateButton.setTitle(dateFormatter.string(from: sender.date), for: .normal)
        
        dueDate = sender.date
        
        
    }
    
    // priority button
    @IBAction func PriorityButtonAction(_ sender: Any) {
        
        PriorityPicker.isHidden = false
    }
    
    
    // duedate button
    @IBAction func DueDateButtonAction(_ sender: Any) {
        
        DueDatePicker.isHidden = false
    }
    


    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        let taskName = TaskName.text ?? ""
        var priority :Task.Priority
        var status :Bool = false
        //let dueDate =
        
        if pickerSelector == "Low" {
            priority = .low
        } else if pickerSelector == "Medium" {
            priority = .medium
        } else {
            priority = .high
        }
        
        if CompletedStatus.selectedSegmentIndex == 0 {
            
            status = false
        } else if CompletedStatus.selectedSegmentIndex == 1 {
            status = true
        }
        
        
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        // Set the task to be passed to TaskTableViewController after the unwind segue.
        task = Task(text: taskName, dueDate: dueDate!, priority: priority, completed: status)
        print ("task added")
    }
    
    

}
