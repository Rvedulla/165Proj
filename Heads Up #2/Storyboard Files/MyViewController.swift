//
//  MyViewController.swift
//  Heads Up #2
//
//  Created by Rohit Vedulla on 4/21/24.
//

import Foundation
import FSCalendar
import UIKit

struct Event {
    let date: Date
    let description: String
}

class MyViewController: UIViewController {
    
   

    
    @IBOutlet weak var calendar: FSCalendar!
    
    @IBOutlet weak var eventsLabel: UILabel!

    func displayEvents(_ events: [Event]) {
        let descriptions = events.map { $0.description }.joined(separator: ", ")
        eventsLabel.text = "Events: \(descriptions)"
    }

    
    var events: [Event] = [
            Event(date: DateComponents(calendar: Calendar.current, year: 2023, month: 1, day: 1).date!, description: "New Year's Day"),
            Event(date: DateComponents(calendar: Calendar.current, year: 2023, month: 2, day: 14).date!, description: "Valentine's Day"),
            // Add more events as needed
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup code here
        if let calendar = calendar {
               let specificDate = DateComponents(calendar: Calendar.current, year: 2023, month: 1, day: 1).date!
               calendar.setCurrentPage(specificDate, animated: true)
           } else {
               // Handle nil case, e.g., log an error or display a message
               print("Calendar is not initialized")
           }
        
    }
    
    func events(for date: Date) -> [Event] {
        return events.filter { Calendar.current.isDate($0.date, inSameDayAs: date) }
    }

    
    
   

    
    @IBAction func ToUpcomingEvents(_ sender: UIButton) {
    }
    @IBAction func TOCalendar(_ sender: UIButton) {
    }
    @IBAction func ToMenu(_ sender: UIButton) {
    }
    
    
    

}


extension MyViewController: FSCalendarDelegate {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let selectedEvents = events(for: date)
        displayEvents(selectedEvents)
    }
}


