//
//  Program.swift
//  CoreDataTest
//
//  Created by Arash Sadeghieh E on 6/10/2014.
//  Copyright (c) 2014 Arash Sadeghieh Eshtehadi. All rights reserved.
//

import Foundation
import CoreData

@objc(Program)
class Program: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var set: String
    @NSManaged var rep: String
    @NSManaged var muscle: String

}
