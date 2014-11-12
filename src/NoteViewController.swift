//
//  NoteViewController.swift
//  Custom Nav
//
//  Created by Giles Van Gruisen on 11/10/14.
//  Copyright (c) 2014 Giles Van Gruisen. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {

    @IBOutlet var textView: UITextView!
    var noteViewModel: NoteViewModel!

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: true)

        noteViewModel.publink.subscribe { (object: AnyObject?) -> () in
            if let newNoteViewModel = object as? NoteViewModel {
                self.title = newNoteViewModel.title!
                self.textView.attributedText = newNoteViewModel.attributedText
            }
        }        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
