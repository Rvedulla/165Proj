import UIKit

class AddEventViewController: UIViewController {
    @IBOutlet weak var eventTitleField: UITextField!
    @IBOutlet weak var eventDescriptionField: UITextField!
    
    var selectedDate: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func saveEvent(_ sender: UIButton) {
        guard let date = selectedDate,  // Ensure there's a selected date
              let title = eventTitleField.text, !title.isEmpty else {
            return  // Don't save if there's no title or date
        }
        
        let description = eventDescriptionField.text
        let newEvent = Event(title: title, date: date, description: description)
        EventManager.shared.addEvent(newEvent)  // Save the event
        
        // Dismiss or navigate back to the calendar
        navigationController?.popViewController(animated: true)  // Navigate back to the previous screen
    }
}
