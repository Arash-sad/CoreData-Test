//
//  MyTableViewController.swift
//  CoreDataTest
//
//  Created by Arash Sadeghieh E on 6/10/2014.
//  Copyright (c) 2014 Arash Sadeghieh Eshtehadi. All rights reserved.
//

import UIKit
import CoreData

class MyTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {

    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext!
    
    var fetchedResultsController:NSFetchedResultsController = NSFetchedResultsController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fetchedResultsController = getFetchedResultsController()
        fetchedResultsController.delegate = self
        fetchedResultsController.performFetch(nil)
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return fetchedResultsController.sections!.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedResultsController.sections![section].numberOfObjects
    }

   
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
//        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        let thisProgram = fetchedResultsController.objectAtIndexPath(indexPath) as Program
        var cell: ProgramCell = tableView.dequeueReusableCellWithIdentifier("cell") as ProgramCell
        cell.cellNameLabel.text = thisProgram.name
        cell.cellSetLabel.text = thisProgram.set
        cell.cellRepLabel.text = thisProgram.rep
        
        return cell

    }
    
    //UITableViewDelegate

    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        
        
//        if section == 0 && anyToDoLeft(){
//            return "To do"
//        }
//        else {
//            return "Completed"
//        }
        return "TEST"
    }
   
    
    // NSFetchedResultsControllerDelegate
    
    func controllerDidChangeContent(controller: NSFetchedResultsController) {
        tableView.reloadData()
    }
    
    //Helper
    
    func taskFetchRequest() -> NSFetchRequest {
        let fetchRequest = NSFetchRequest(entityName: "Program")
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        let completedDescriptor = NSSortDescriptor(key: "muscle", ascending: true)
        fetchRequest.sortDescriptors = [completedDescriptor, sortDescriptor]
        
        return fetchRequest
    }
    
    func getFetchedResultsController() -> NSFetchedResultsController {
        
        fetchedResultsController = NSFetchedResultsController(fetchRequest: taskFetchRequest(), managedObjectContext: managedObjectContext, sectionNameKeyPath: "muscle", cacheName: nil)
        return fetchedResultsController
    }
    

}
