//
//  Task.swift
//  Journal
//
//  Created by Andi Xiong on 2019-01-02.
//  Copyright © 2019 Andi Xiong. All rights reserved.
//

import Foundation

struct Task : Codable {
    
    var taskName : String
    var completed : Bool
    var dateCreated : Date
    var id : UUID
    
    func saveItem () {
        DataManager.save(self, id.uuidString)
    }
    
    func deleteItem () {
        DataManager.delete(id.uuidString)
    }
    
    mutating func markComplete () {
        self.completed = true
        DataManager.delete(id.uuidString)
    }
    
    
}
