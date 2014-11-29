//
//  NoteCell.swift
//  CDNotes
//
//  Created by Giles Van Gruisen on 11/12/14.
//  Copyright (c) 2014 Giles Van Gruisen. All rights reserved.
//

import UIKit

class NoteCell: UITableViewCell {

    var noteViewModel: NoteViewModel! {
        willSet {
            newValue.publink.subscribe { (object: AnyObject?) -> () in
                if let newNoteViewModel = object as? NoteViewModel {
                    self.textLabel.text = newNoteViewModel.rawText
                    self.detailTextLabel?.text = newNoteViewModel.timeAgoShort
                }
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        println("POOOPawake")
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
