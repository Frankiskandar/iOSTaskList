//
//  TaskList.swift
//  Frangky_Fnu_Lab04
//
//  Created by Fnu Frangky on 11/3/17.
//  Copyright © 2017 Fnu Frangky. All rights reserved.
//


import UIKit

class TaskList: NSObject {
    
    private var count :Int
    private final var tasks = [Task]()
    
    override init() {
        count = 0
    }
    convenience init(c : Int){
        self.init()
    }
    
    
    //Returns an Array containing all Tasks which are marked completed.
    func completeTasks() -> [Any] {
        var array = [Task]()
        
        for t in tasks {
            if t.completed == true {
                array.append(t)
            }
        }
        return array
    }
    
    //Returns an Array containing all Tasks which are not completed.
    func incompleteTasks() -> [Any] {
        var array = [Task]()
        
        for t in tasks {
            if t.completed == false {
                array.append(t)
            }
        }
        return array
    
    }
    
    //Returns an Arrary containing all Tasks in the list.
    func allTasks() -> [Any] {
        var array = [Task]()
        
        for t in tasks {
            //print("Item \(index): \(value)")
            array.append(t) // adding the matching object to array
        }
        return array
    }
    
    //Returns an Array consisting of classes which are past due. Past due tasks are defined as tasks which have a due date prior to the current day. For example, a Task with a dueDate of 5:16:00pm on 9/11/2015 is not past due until the date rolls over to 9/12/2015.
    
    func pastDueTasks() -> [Any] {
        var array = [Task]()
        let currentDate = Date()
        
        for t in tasks {
            if t.dueDate! < currentDate {
                array.append(t)
            }
        }
  
        return array
    }
    
    //Returns an Array consisting of classes which are between the specified start and stop dates/times
    func tasksBetween(_ start: Date, and stop: Date) -> [Any] {
        var array = [Task]()
        
        for t in tasks {
            if t.dueDate! >= start && t.dueDate! <= stop {
                array.append(t)
            }
        }
        
        return array
    }
    
    //Returns an Array containing all Tasks with a priority matching the specified Priority.
    func tasks(priority p: Task.Priority) -> [Any] {
        var array = [Task]()
        for t in tasks {
            if t.priority == p {
                array.append(t)
            }
        }
        return array
    }
    
    // This method should add the specified Task to the list. If a Task already exists in the list where all properties match the
    // specified task, then the method should return NO and not insert anything. If no matching Task is found, the item should be inserted and the method should return YES.
    func add(_ task: Task) -> Bool {
        for t in tasks {
            if t == task {
                //found task with same properties
                print("found matching  task")
                return false
            }
        }
        // matching task not found
        tasks.append(task)
        print("add successful")
        count = count + 1
        return true
    }
    
    //This method should remove all Tasks from the list.
    func removeAllTasks() {
        print("removing all tasks") 
        tasks.removeAll()
        
    }
    
    //This method should remove the specified Task from the list. If a Task exists in the list where all properties match the
    //pecified task, then the method should return YES and remove the item from the list. If no matching Task is found, then nothing should be removed and the method should return NO.
    func remove(_ task: Task) -> Bool {
        for (index, value) in tasks.enumerated() {
            if value == task {
                tasks.remove(at: index)
                count = count - 1
                return true
            }
        }
        //loop ends
        print("no matching task to be removed")
        return false
    }
    
    //This method should remove all Tasks that are marked complete from the list.
    func removeCompletedTasks() {
        for (index, value) in tasks.enumerated() {
            //print("Item \(index): \(value)")
            if value.completed == true {
                tasks.remove(at: index)
                count = count - 1
            }
        }
    }
        
    //print all the tasks
    func listTasks() {
        for task in tasks {
            print(task.toString())
        }     
    }
}
