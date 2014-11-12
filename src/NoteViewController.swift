//
//  NoteViewController.swift
//  Custom Nav
//
//  Created by Giles Van Gruisen on 11/10/14.
//  Copyright (c) 2014 Giles Van Gruisen. All rights reserved.
//

import UIKit

class NoteViewController: UIViewController {

    required init(coder aDecoder: NSCoder) {
        note = ""
        super.init(coder: aDecoder)
    }

    @IBOutlet var textView: UITextView!
    var note: String

    override func viewDidLoad() {
        super.viewDidLoad()

        self.textView.text = note
        self.title = note
        // Do any additional setup after loading the view.
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
