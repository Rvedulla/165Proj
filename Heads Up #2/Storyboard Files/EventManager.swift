import Foundation

struct Event: Codable {  // Make the Event structure Codable for UserDefaults
    let title: String
    let date: Date
    let description: String?  // Optional description
}

class EventManager {
    static let shared = EventManager()  // Singleton instance
    
    private var events: [Event] = []  // In-memory storage
    
    private init() {  // Private initializer to enforce singleton pattern
        // Load saved events from UserDefaults
        if let savedData = UserDefaults.standard.data(forKey: "events"),
           let savedEvents = try? JSONDecoder().decode([Event].self, from: savedData) {
            events = savedEvents
        }
    }
    
    func addEvent(_ event: Event) {
        events.append(event)  // Add event to the in-memory list
        saveEvents()  // Save to UserDefaults
    }
    
    func getEvents(for date: Date) -> [Event] {
        // Filter events to get only those that match the specified date
        return events.filter { Calendar.current.isDate($0.date, inSameDayAs: date) }
    }
    
    private func saveEvents() {
        // Save events to UserDefaults
        if let data = try? JSONEncoder().encode(events) {
            UserDefaults.standard.set(data, forKey: "events")
        }
    }
}
