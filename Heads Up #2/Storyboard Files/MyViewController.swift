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
            calendar.isUserInteractionEnabled = true
            // Header customization
            calendar.appearance.headerMinimumDissolvedAlpha = 0.0  // Fully visible navigation arrows
            calendar.appearance.headerDateFormat = "MMMM yyyy"  // Format for header text
            
            // Weekday appearance
            calendar.appearance.weekdayTextColor = .blue  // Set weekday text color
            calendar.appearance.weekdayFont = UIFont.boldSystemFont(ofSize: 16)  // Bold weekday font
            calendar.swipeToChooseGesture.isEnabled = true  // Enable swipe gestures
            calendar.scrollDirection = .horizontal  // Allows horizontal swipe to change months

            // Event indicators
            calendar.appearance.eventDefaultColor = .red  // Set color for event dots
            } else {
                print("Calendar is not connected in storyboard.")
            }
        
        

            
                /*Header customization
                calendar.appearance.headerMinimumDissolvedAlpha = 0.0  // Fully visible navigation arrows
                calendar.appearance.headerDateFormat = "MMMM yyyy"  // Format for header text
                
                // Weekday appearance
                calendar.appearance.weekdayTextColor = .blue  // Set weekday text color
                calendar.appearance.weekdayFont = UIFont.boldSystemFont(ofSize: 16)  // Bold weekday font
                
                // Event indicators
                calendar.appearance.eventDefaultColor = .red  // Set color for event dots
            */
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDayDetails",  // Matches the storyboard
           let destinationVC = segue.destination as? DayDetailsViewController,
           let selectedDate = sender as? Date {
            destinationVC.selectedDate = selectedDate  // Pass the selected date
        }
    }



    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
            performSegue(withIdentifier: "showDayDetails", sender: date)  // Perform the segue with the correct identifier
        }

    func navigateToYear(_ year: Int) {
        guard let calendar = calendar else { return }

        let components = Calendar.current.dateComponents([.year], from: calendar.currentPage)
        if let currentYear = components.year {
            let offset = year - currentYear
            let newDate = Calendar.current.date(byAdding: .year, value: offset, to: calendar.currentPage)
            if let date = newDate {
                calendar.setCurrentPage(date, animated: true)  // Navigate to the new year
            }
        }
    }
    
    func navigateToMonth(_ month: Int) {
        guard let calendar = calendar else { return }

        let components = Calendar.current.dateComponents([.month], from: calendar.currentPage)
        if let currentMonth = components.month {
            let offset = month - currentMonth
            let newDate = Calendar.current.date(byAdding: .month, value: offset, to: calendar.currentPage)
            if let date = newDate {
                calendar.setCurrentPage(date, animated: true)  // Navigate to the new Month
            }
        }
    }
    
    
    @IBAction func goToNextMonth(_ sender: UIButton) {
           let oneMonthAhead = Calendar.current.date(byAdding: .month, value: +1, to: calendar.currentPage)
           if let nextMonth = oneMonthAhead {
               calendar.setCurrentPage(nextMonth, animated: true)  // Navigate to the next month
           }
       }
    
    @IBAction func goToPreviousMonth(_ sender: UIButton) {
            let oneMonthBack = Calendar.current.date(byAdding: .month, value: -1, to: calendar.currentPage)
            if let previousMonth = oneMonthBack {
                calendar.setCurrentPage(previousMonth, animated: true)  // Navigate to the previous month
            }
        }
    
    @IBAction func selectYear(_ sender: UIButton) {
            let alert = UIAlertController(title: "Select Year",
                                          message: "Enter the year you want to navigate to.",
                                          preferredStyle: .alert)
            
            alert.addTextField { textField in
                textField.placeholder = "Enter year"
                textField.keyboardType = .numberPad  // Ensure numeric input
            }
            
            let confirmAction = UIAlertAction(title: "Confirm", style: .default) { [weak self] _ in
                if let yearText = alert.textFields?.first?.text,
                   let year = Int(yearText), year >= 0 {
                    self?.navigateToYear(year)
                }
            }
            
            alert.addAction(confirmAction)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            present(alert, animated: true, completion: nil)
        }
    
    @IBAction func selectMonth(_ sender: UIButton) {
        let alert = UIAlertController(
            title: "Select Month",
            message: "Enter the month you want to navigate to (1-12).",
            preferredStyle: .alert
        )
        
        alert.addTextField { textField in
            textField.placeholder = "Enter Month"
            textField.keyboardType = .numberPad  // Ensure numeric input
        }
        
        let confirmAction = UIAlertAction(title: "Confirm", style: .default) { [weak self] _ in
            if let monthText = alert.textFields?.first?.text,
               let month = Int(monthText), month >= 1, month <= 12 {  // Ensure it's between 1 and 12
                self?.navigateToMonth(month)  // Navigate to the selected month
            }
        }
        
        alert.addAction(confirmAction)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
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





