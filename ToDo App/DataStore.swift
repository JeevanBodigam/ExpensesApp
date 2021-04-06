//
//  DataStore.swift
//  ToDo App
//
//  Created by Bodigam,Jeevan on 4/5/21.
//  Copyright © 2021 Bodigam,Jeevan. All rights reserved.
//

import Foundation

import SwiftUI
import Combine

struct Task:Identifiable{
    var id=UUID()
    var expense:String
    var toDoItem:String;
    
}

class TaskStore:ObservableObject{
    @Published var tasks=[Task]()
    
}
