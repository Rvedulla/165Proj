//
//  MyViewController.swift
//  Heads Up #2
//
//  Created by Rohit Vedulla, Cole Harris, Sakayt Singh on 4/21/24.
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
           // Create a date formatter to format the selected date
           let dateFormatter = DateFormatter()
           dateFormatter.dateStyle = .long
           let formattedDate = dateFormatter.string(from: date)

           // Create an alert controller
           let alert = UIAlertController(title: "Date Selected",
                                         message: "You selected \(formattedDate)",
                                         preferredStyle: .alert)

           // Add an action to dismiss the alert
           alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))

           // Present the alert
           present(alert, animated: true, completion: nil)
       }

    
    
    
    
    
    
    
    
    @IBAction func openWebsite(_ sender: Any) {
            if let url = URL(string: "https://www.termsfeed.com/live/ad71ad7a-f544-4e1f-b9e4-47c42612cfd6") {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }
    @IBAction func ToUpcomingEvents(_ sender: UIButton) {
    }
    @IBAction func TOCalendar(_ sender: UIButton) {
    }
    @IBAction func ToMenu(_ sender: UIButton) {
    }
    
    
    
    
}





