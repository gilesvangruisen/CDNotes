//
//  NewNoteViewController.swift
//  CDNotes
//
//  Created by Giles Van Gruisen on 11/11/14.
//  Copyright (c) 2014 Giles Van Gruisen. All rights reserved.
//

import UIKit

class NewNoteViewController: UIViewController {

    var notesViewController: NotesTableViewController!
    @IBOutlet var textView: UITextView!

    @IBAction func cancel(sender: UIButton) {
        dismiss()
    }

    @IBAction func saveNote(sender: UIButton) {
        let context = (UIApplication.sharedApplication().delegate as AppDelegate).managedObjectContext()
        var note = Note.insertNewObject(context)

        note.text = textView.text
        note.time = NSDate()

        var error: NSError?
        context.save(&error)
        if let error = error {
            println("Save error: \(error)")

            // Build alert
            let alert = UIAlertController(title: "Oh no!", message: error.description, preferredStyle: .Alert)

            // Cancel action
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))

            // Try again action
            alert.addAction(UIAlertAction(title: "Try again", style: UIAlertActionStyle.Default, handler: { (action: UIAlertAction!) -> Void in
                self.saveNote(sender)
            }))

            presentViewController(alert, animated: true, completion: nil)

        } else {
            notesViewController.refresh()
            dismiss()
        }
    }

    func dismiss() {
        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: true)
        dismissViewControllerAnimated(true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.Default, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        println("refresh?")
    }

}
