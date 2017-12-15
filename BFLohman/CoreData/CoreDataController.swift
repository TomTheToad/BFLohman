//
//  CoreDataController.swift
//  BFLohman
//
//  Created by VICTOR ASSELTA on 12/14/17.
//  Copyright © 2017 TomTheToad. All rights reserved.
//

import UIKit
import CoreData

class CoreDataController: NSObject {
    
    // Fields
    let managedObjectContext: NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Internal application error")
        }
        return appDelegate.persistentContainer.viewContext
    }()
    
}
