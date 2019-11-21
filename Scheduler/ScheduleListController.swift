//
//  ViewController.swift
//  Scheduler
//
//  Created by Liubov Kaper  on 11/20/19.
//  Copyright © 2019 Luba Kaper. All rights reserved.
//

import UIKit

class ScheduleListController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
var events = [Event]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        events = Event.getTestData()
    }
    
    // unwind segue
    @IBAction func addNewEvent(segue: UIStoryboardSegue) {
        
      //  get a reference to CreateEventController instance
        guard let createEventController = segue.source as? CreateEventController,
            let createdEvent = createEventController.event else {
            fatalError("failed to access CreateEventController")
           // event = createEventController.
        }
        // insert into our events array
        events.insert(createdEvent, at: 0) // top of the events array
        
        // create indexPath to be inserted into tableView
        let indexView = IndexPath(row: 0, section: 0) // will represent top of table view
        
        // use indexPath to insert into table view
        tableView.insertRows(at: [indexView], with: .automatic)
        }

}
extension ScheduleListController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath)
        let event = events[indexPath.row]
        cell.textLabel?.text = event.name
        cell.detailTextLabel?.text = event.date.description
        return cell
    }
    // MARK:- deleting row in a table view
    // editingStyle is enum that have cases: delet, insert, none
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        switch  editingStyle {
        case .insert:
            print("inserting")
        case.delete:
            print("deleting")
            events.remove(at: indexPath.row) // removes element from events array
            tableView.deleteRows(at: [indexPath], with: .automatic)
        default:
            print("....")
            
        }
    }
}

