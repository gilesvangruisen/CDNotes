//
//  PubLink.swift
//  CDNotes
//
//  Created by Giles Van Gruisen on 11/12/14.
//  Copyright (c) 2014 Giles Van Gruisen. All rights reserved.
//

import UIKit

class Publink: NSObject {

    var subscriptions: [(AnyObject?) -> ()]
    var last: AnyObject?

    override init() {
        subscriptions = []
    }

    func subscribe(subscription: (AnyObject?) -> ()) {
        subscription(last)
        subscriptions += [subscription]
    }

    func publish(object: AnyObject?) {
        println(object)
        last = object
        for subscription in subscriptions {
            subscription(object)
        }
    }

}
