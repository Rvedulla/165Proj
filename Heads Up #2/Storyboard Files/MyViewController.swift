//
//  MyViewController.swift
//  Heads Up #2
//
//  Created by Rohit Vedulla on 4/21/24.
//

import Foundation
import FSCalendar
import UIKit


class MyViewController: UIViewController, FSCalendarDelegate{
    
    
  
    
    @IBOutlet weak var calendar: FSCalendar!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Setup code here
        if let calendar = calendar {
                calendar.delegate = self
            } else {
                print("Calendar is not connected in storyboard.")
            }
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print("Date selected: \(date)")
    }

    
    
    
    
    
    
    
    
    
    @IBAction func ToUpcomingEvents(_ sender: UIButton) {
    }
    @IBAction func TOCalendar(_ sender: UIButton) {
    }
    @IBAction func ToMenu(_ sender: UIButton) {
    }
    
    
    
    
}





