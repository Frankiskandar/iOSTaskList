//
//  Task.swift
//  Frangky_Fnu_Lab04
//
//  Created by Fnu Frangky on 11/3/17.
//  Copyright © 2017 Fnu Frangky. All rights reserved.
//

import UIKit

class Task: NSObject {
    
    enum Priority {
    case low, medium, high
    }
    
    var text :NSString
    var dueDate :Date?
    var priority :Priority
    var completed :Bool
    
    //
    override init() {
        text = ""
        dueDate = nil
        priority = .medium
        completed = false
    }
    
    init(text t: String, dueDate d: Date, priority p: Priority, completed c: Bool) {
        self.text = t as NSString
        self.dueDate = d 
        self.priority = p
        self.completed = c
    }
    
    convenience init(priorityp : Priority) {
        self.init()
        
    }

//    convenience init(text t: String, dueDate d: Date, priority p: Priority, completed c: Bool) {
//        self.text = t as NSString
//        self.dueDate = d
//        self.priority = p
//        self.completed = c
//    }
    
    public func toString()-> String {
        let info = "Text: \(self.text)\ndueDate: \(self.dueDate)\nPriority: \(self.priority)\ncompleted: \(self.completed)\n"
        
        return info
        
    }
    
    
}
