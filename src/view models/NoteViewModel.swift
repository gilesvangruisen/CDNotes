//
//  NoteViewModel.swift
//  CDNotes
//
//  Created by Giles Van Gruisen on 11/12/14.
//  Copyright (c) 2014 Giles Van Gruisen. All rights reserved.
//

import UIKit

class NoteViewModel: NSObject {

    var publink = Publink()

    var title: String?
    var timeAgo: String?
    var timeAgoShort: String?

    var rawText: String?
    var attributedText: NSAttributedString?

    var note: Note!

    func attributedText(text: String) -> NSAttributedString {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 3
        return NSAttributedString(string: note.text, attributes: [NSParagraphStyleAttributeName: paragraphStyle])
    }

    convenience init(note: Note!) {
        self.init()
        self.note = note

        title = note.text.substringToIndex(advance(note.text.startIndex, 12))
        timeAgo = note.time.timeAgo()
        timeAgoShort = note.time.timeAgoSimple()
        rawText = note.text
        attributedText = attributedText(note.text)
        publink.publish(self)
    }

}
