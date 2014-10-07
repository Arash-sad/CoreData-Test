//
//  AddExerciseViewController.swift
//  CoreDataTest
//
//  Created by Arash Sadeghieh E on 6/10/2014.
//  Copyright (c) 2014 Arash Sadeghieh Eshtehadi. All rights reserved.
//

import UIKit
import CoreData

class AddExerciseViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var setTextField: UITextField!
    @IBOutlet weak var repTextField: UITextField!
    @IBOutlet weak var muscleTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addButtonPressed(sender: UIButton) {
        
        let appDelegate = (UIApplication.sharedApplication().delegate as AppDelegate)
        
        let managedObjectContext = appDelegate.managedObjectContext
        let entityDescription = NSEntityDescription.entityForName("Program", inManagedObjectContext: managedObjectContext!)
        let program = Program(entity: entityDescription!, insertIntoManagedObjectContext: managedObjectContext!)
        program.name = nameTextField.text
        program.set = setTextField.text
        program.rep = repTextField.text
        program.muscle = muscleTextField.text
        
        appDelegate.saveContext()
        
        // Error ?!!
        
        var request = NSFetchRequest(entityName: "Program")
        var error:NSError? = nil
        
        var results:NSArray = managedObjectContext!.executeFetchRequest(request, error: &error)!
        
        for res in results {
            println(res)
        }
        
        self.dismissViewControllerAnimated(true, completion: nil)
        
    }

    @IBAction func cancelButtonPressed(sender: UIButton) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
