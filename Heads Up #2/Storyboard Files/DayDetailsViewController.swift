import UIKit

class DayDetailsViewController: UIViewController {
    
    var selectedDate: Date?  // To hold the date passed from the previous view controller
    
    @IBOutlet weak var dateLabel: UILabel!  // UI element to display the date
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let date = selectedDate {
            // Format and display the selected date
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateLabel.text = "Date: \(dateFormatter.string(from: date))"
            
            // Additional logic to display events or other relevant information
        }
    }
}
