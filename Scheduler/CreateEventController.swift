//
//  CreateEventController.swift
//  Scheduler
//
//  Created by Liubov Kaper  on 11/20/19.
//  Copyright © 2019 Luba Kaper. All rights reserved.
//

import UIKit

class CreateEventController: UIViewController {
    
    
    @IBOutlet weak var createEventTextField: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var event: Event? // default is nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        createEventTextField.delegate = self
        
        // instantiate a default value for event
        event = Event(date: Date(), name: "Swift Rocks Lab") // Date() createsbcurrent date
    }
    
    @IBAction func datePickerChange(sender: UIDatePicker) {
        
        // update date of event
        event?.date = sender.date
    }
}

extension CreateEventController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // dismiss keyboard
        textField.resignFirstResponder()
        
        // update name of event
        event?.name = textField.text ?? "no event name"
        return true
    }
}
