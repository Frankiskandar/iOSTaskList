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
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return arr[row]
    }
    
    
    var arr: [String] = ["Slow", "Medium", "High"]
    var pickerSelector = ""
    

    @IBOutlet weak var TaskName: UITextField!
    @IBOutlet weak var CompletedStatus: UISegmentedControl!
    
    // Priority
    @IBOutlet weak var PriorityButton: UIButton!
    @IBOutlet weak var PriorityPicker: UIPickerView!
    
    
    
    
    
    // DueDate
    @IBOutlet weak var DueDateButton: UIButton!
    @IBOutlet weak var DueDatePicker: UIDatePicker!
    
    
    
    @IBOutlet weak var saveTask: UINavigationItem!
    
    
    var task: Task?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PriorityPicker.isHidden = false
        DueDatePicker.isHidden = false

        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === saveTask else {

            
            
            
            os_log("The save button was not pressed, cancelling", log: OSLog.default, type: .debug)
            return
        }
        let taskName = TaskName.text ?? ""
        //let dueDate =
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    

}
