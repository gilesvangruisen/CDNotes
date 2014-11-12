//
//  NotesTableViewController.swift
//  Custom Nav
//
//  Created by Giles Van Gruisen on 11/10/14.
//  Copyright (c) 2014 Giles Van Gruisen. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController {

    var noteViewModels: [NoteViewModel]

    required init(coder aDecoder: NSCoder) {
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        noteViewModels = Note.fetchNotes(appDelegate.managedObjectContext())!

        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return noteViewModels.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Note", forIndexPath: indexPath) as UITableViewCell

        let noteViewModel = noteViewModels[indexPath.row]

        func updateNoteViewModel(object: AnyObject?) -> () {
            if let newNoteViewModel = object as? NoteViewModel {
                cell.textLabel.text = newNoteViewModel.rawText
                cell.detailTextLabel?.text = newNoteViewModel.timeAgo
            }
        }

        updateNoteViewModel(noteViewModel)
        noteViewModel.publink.subscribe(updateNoteViewModel)

        return cell
    }

    func refresh() {
        refetch()
        tableView.reloadData()
    }

    func refetch() {
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        noteViewModels = Note.fetchNotes(appDelegate.managedObjectContext())!
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let newNoteViewController = segue.destinationViewController as? NewNoteViewController {
            newNoteViewController.notesViewController = self
        } else if let noteViewController = segue.destinationViewController as? NoteViewController {
            let indexPath = tableView.indexPathForCell(sender as UITableViewCell)!
            noteViewController.noteViewModel = noteViewModels[indexPath.row]
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
