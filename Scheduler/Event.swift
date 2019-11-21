//
//  Event.swift
//  Scheduler
//
//  Created by Liubov Kaper  on 11/20/19.
//  Copyright © 2019 Luba Kaper. All rights reserved.
//

import Foundation

struct Event {
    var date: Date
    var name: String
    
    
    static func getTestData() -> [Event] {
        var events = [Event]()
        
       let eventNames = ["code", "Unit Assessment", "iOS Soho", "Ladies night out"]
        
        for eventNmae in eventNames {
            let event = Event(date: Date(), name: eventNmae)
            events.append(event)
        }
        return events
    }
    
    
    
}
