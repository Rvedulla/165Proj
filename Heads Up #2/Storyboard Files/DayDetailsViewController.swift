import UIKit

class DayDetailsViewController: UIViewController {
    
    var selectedDate: Date?  // The date for which events are displayed
    
    @IBOutlet weak var dateLabel: UILabel!  // To display the selected date
    @IBOutlet weak var eventTitleField: UITextField!  // To input new event title
    @IBOutlet weak var eventDescriptionField: UITextField!  // To input new event description
    @IBOutlet weak var eventsList: UIStackView!  // To display existing events
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let date = selectedDate {
            // Display the selected date
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateLabel.text = "Date: \(dateFormatter.string(from: date))"
            
            // Display existing events for this date
            updateEventsList(for: date)  // Custom method to update the list of events
        }
    }
    
    // Method to update the list of events for the selected date
    func updateEventsList(for date: Date) {
        eventsList.arrangedSubviews.forEach { $0.removeFromSuperview() }  // Clear existing views
        
        let events = EventManager.shared.getEvents(for: date)  // Retrieve events for the date
        for event in events {
            let eventLabel = UILabel()  // Create a label for each event
            eventLabel.text = event.title
            eventsList.addArrangedSubview(eventLabel)  // Add to the stack view
        }
    }
    
    @IBAction func addEvent(_ sender: UIButton) {
        // Save the event when the user clicks the add button
        guard let date = selectedDate,  // Ensure there's a selected date
              let title = eventTitleField.text, !title.isEmpty else {
            return  // Ensure there's a title
        }
        
        let description = eventDescriptionField.text  // Optional description
        let newEvent = Event(title: title, date: date, description: description)
        
        EventManager.shared.addEvent(newEvent)  // Save the event
        
        // Update the list of events after adding
        updateEventsList(for: date)
        
        // Clear the text fields
        eventTitleField.text = ""
        eventDescriptionField.text = ""
    }
}
